#!/bin/sh

python manage.py makemigrations
python manage.py migrate --no-input
python manage.py collectstatic --no-input

echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('dragos', 'dragos.badiu.a@hotmail.com', 'Maudeg12.34') if not User.objects.filter(username='dragos').exists() else print('Superuser already exists.')" | python manage.py shell

waitress-serve --port=8000 backend.wsgi:application