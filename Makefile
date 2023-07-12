all: clean dockerize push integration-test

clean:
	docker stop $$(docker ps -a -q)
	docker rm $$(docker ps -a -q)
	docker rmi aimarlauzirika/alzatest -f

dockerize:
	cd docker && docker build -t aimarlauzirika/alzatest .

push:
	docker push aimarlauzirika/alzatest:latest

integration-test:
	docker run -d -p 80:80 --name integration-test aimarlauzirika/alzatest:latest

launch:
	open http://localhost

