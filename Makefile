.PHONY: clean setup_env venv test install-dev install-test lint

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
