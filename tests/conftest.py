import pytest
from mflix.factory import create_app
from mflix.settings import TestConfig


@pytest.fixture
def app():
    app = create_app(config_object=TestConfig)
    return app
