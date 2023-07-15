APP_CONTAINER_NAME = app-alzatest

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
	docker rmi aimarlauzirika/alzatest -f

dockerize:
	cd docker && docker build -t aimarlauzirika/alzatest .

push:
	docker push aimarlauzirika/alzatest:latest

integration-test:
	docker run -d -p 80:80 --name $(APP_CONTAINER_NAME) aimarlauzirika/alzatest:latest
	docker stop $(APP_CONTAINER_NAME)
	docker rm $(APP_CONTAINER_NAME)

launch:
	docker run -d -p 80:80 --name $(APP_CONTAINER_NAME) aimarlauzirika/alzatest:latest
	open http://localhost

