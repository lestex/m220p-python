## mflix

![Mflix](https://github.com/lestex/M220P-mongo-python/workflows/Mflix/badge.svg) ![Lint](https://github.com/lestex/M220P-mongo-python/workflows/Lint/badge.svg?branch=master)

This is a short guide on setting up the system and environment dependencies
required for the **mflix** application to run.

### Local Development Environment Configuration

#### Virtualenv


Once you've installed Python 3, you will have to setup a
`virtualenv` environment:

```sh

  # navigate to the mflix-python directory
  cd mflix-python

  # create the virtual environment for MFlix
  python -m venv .venv

  # activate the virtual environment
  source .venv/bin/activate

```
You can deactivate the virtual environment with the following command:

```sh

  deactivate

```

Please remember that you may have to reactivate the virtual environment if you
open a new Terminal or Command Prompt window, or restart your system.


#### Python Library Dependencies

Once the Python 3 environment is activated, we need to install our python
dependencies. These dependencies are defined in the `requirements/dev.txt` file,
and can be installed with the following command:

```sh

  pip install -r requirements/dev.txt
  pip install -r requirements/test.txt

```

#### MongoDB Installation


It is recommended to connect **mflix** with MongoDB Atlas, so you do not need to
have a MongoDB server running on your host machine.
But there is `docker-compose` file to set mongodb locally:

```sh

  docker-compose up -d

```
This will set mongo on local port `27017`.

That said, you are still required to have the MongoDB server installed, in order
to be able to use two server tool dependencies:

- `mongorestore`

  - A utility for importing binary data into MongoDB.

- `mongo`

  - The MongoDB shell


#### Running the Application

To start **mflix**, run the following command:

```sh

  python run.py

```

And then point your browser to [http://localhost:5000](http://localhost:5000/).


#### Running migrations

To run migrations you need to setup `FLASK_APP` variable and run flask command:

```sh

  export FLASK_APP=run.py

  flask migrate

```

#### Running the Unit Tests

To run the unit tests for this course, you will use `pytest`. Each course lab
contains a module of unit tests that you can call individually with a command
like the following:

```sh

  pytest -m LAB_UNIT_TEST_NAME

```

Each ticket will contain the command to run that ticket's specific unit tests.
