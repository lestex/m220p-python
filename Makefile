.PHONY: build run clean setup_env venv test install-dev install-test lint

IMAGE_NAME = leandevops/mflix
CONTAINER_NAME = mflix

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run --rm -p 5000:5000 --name $(CONTAINER_NAME) $(IMAGE_NAME)

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
