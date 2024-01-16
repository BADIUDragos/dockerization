#!/bin/sh

python manage.py makemigrations
python manage.py migrate --no-input
python manage.py collectstatic


waitress-serve --port=8000 backend.wsgi:application