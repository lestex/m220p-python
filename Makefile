.PHONY: build run clean inspect shell stop rmi\
		setup_env venv test install-dev install-test lint

IMAGE_NAME = leandevops/mflix
CONTAINER_NAME = mflix

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run --rm -p 5000:5000 --name $(CONTAINER_NAME) $(IMAGE_NAME)

inspect:
	docker inspect $(CONTAINER_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) /bin/sh

stop:
	docker stop $(CONTAINER_NAME)

rmi:
	docker ps -a | grep '$(CONTAINER_NAME)' | awk '{print $$1}' | xargs docker rm \
	docker images | grep '$(IMAGE_NAME)' | awk '{print $$3}' | xargs docker rmi

clean:
	rm -rf .venv

setup_env:
	python -m venv .venv

venv:
	( source .venv/bin/activate )

test:
	pytest -v -s

install-dev: venv
	pip install -r requirements/dev.txt

install-test: venv
	pip install -r requirements/test.txt

flake:
	flake8 . --count --show-source --statistics
    flake8 . --count --exit-zero --max-complexity=10

lint: flake
