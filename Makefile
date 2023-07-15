APP_CONTAINER_NAME = app-alzatest

all: clean dockerize push integration-test

clean:
	@if [ $$(docker ps -a -q | wc -l) != 0 ];\
	then\
		echo "hay contenedores";\
		docker stop $$(docker ps -a -q);\
		docker rm $$(docker ps -a -q);\
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

launch:
	open http://localhost

