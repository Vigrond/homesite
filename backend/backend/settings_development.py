
from backend.settings import *

ALLOWED_HOSTS = ['*']
DEBUG = True

ENV = 'development'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'database',
        'USER': 'user',
        'PASSWORD': 'pass',
        'HOST': 'homesite_db',
        'PORT': '5432',
        'TEST': {
            'NAME': 'test_database'
        }
    }
}
