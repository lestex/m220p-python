from mflix.factory import create_app
from flask.helpers import get_debug_flag
from mflix.settings import DevConfig, ProdConfig

CONFIG = DevConfig if get_debug_flag() else ProdConfig

app = create_app(CONFIG)
