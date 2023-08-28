from environ import environ

from .settings import *

env = environ.Env()

SECRET_KEY = "teste"
DEBUG = True
ALLOWED_HOSTS = ["0.0.0.0", "127.0.0.1", "localhost"]

STATIC_URL = env("STATIC_URL", default="/static/")
STATIC_ROOT = env("STATIC_ROOT", default="staticfiles")

STATICFILES_STORAGE = "django.contrib.staticfiles.storage.StaticFilesStorage"
DEFAULT_FILE_STORAGE = "django.core.files.storage.FileSystemStorage"

DATABASES['default'] = {
  'ENGINE': 'django.db.backends.sqlite3',
  'NAME': f"{BASE_DIR}db.sqlite3",
}
