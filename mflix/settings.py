"""Application configuration."""
import os
from datetime import timedelta


class Config(object):
    """Base configuration."""

    SECRET_KEY = os.environ.get('CONDUIT_SECRET', 'secret-key')  # TODO: Change me
    APP_DIR = os.path.abspath(os.path.dirname(__file__))  # This directory
    PROJECT_ROOT = os.path.abspath(os.path.join(APP_DIR, os.pardir))


class ProdConfig(Config):
    """Production configuration."""

    ENV = 'prod'
    DEBUG = False
    MFLIX_DB_URI = 'mongodb://localhost'
    MFLIX_NS = 'sample_mflix'


class DevConfig(Config):
    """Development configuration."""

    ENV = 'dev'
    DEBUG = True
    MFLIX_DB_URI = 'mongodb://localhost'
    MFLIX_NS = 'sample_mflix'


class TestConfig(Config):
    """Test configuration."""

    TESTING = True
    DEBUG = True
    MFLIX_DB_URI = 'mongodb://localhost'
    MFLIX_NS = 'sample_mflix'
