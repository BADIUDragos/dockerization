#!/bin/sh

wait_for_db() {
  until nc -z $1 $2; do
    echo "Waiting for database connection..."
    sleep 5
  done
}

wait_for_db db 5432

echo "Database connection established."

python manage.py makemigrations
python manage.py migrate --no-input
python manage.py collectstatic --no-input

python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('dragos', 'dragos.badiu.a@hotmail.com', 'Maudeg12.34') if not User.objects.filter(username='dragos').exists() else print('Superuser already exists.')"

waitress-serve --port=8000 backend.wsgi:application