APP_CONTAINER_NAME = app-alzatest
APP_IMAGE_NAME = aimarlauzirika/alzatest

all: clean dockerize push integration-test

clean:
	@if [ $$(docker ps -a | grep $(APP_CONTAINER_NAME) | awk -F ' ' '{print $$1}') != 0 ];\
	then\
		echo "hay contenedores";\
		docker stop $(APP_CONTAINER_NAME);\
		docker rm $(APP_CONTAINER_NAME);\
	else\
		echo "no hay contenedores";\
	fi
	docker rmi $(APP_IMAGE_NAME) -f

dockerize:
	cd docker && docker build -t $(APP_IMAGE_NAME) .

push:
	docker push $(APP_IMAGE_NAME):latest

integration-test:
	docker run -d -p 80:80 --name $(APP_CONTAINER_NAME) $(APP_IMAGE_NAME):latest
	docker stop $(APP_CONTAINER_NAME)
	docker rm $(APP_CONTAINER_NAME)

launch:
	docker run -d -p 80:80 --name $(APP_CONTAINER_NAME) $(APP_IMAGE_NAME):latest
	open http://localhost

