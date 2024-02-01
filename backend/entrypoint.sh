#!/bin/sh

python - <<END
import socket
import time

def wait_for_db(host='db', port=5432, timeout=60):
    start_time = time.time()
    while True:
        try:
            with socket.create_connection((host, port), timeout=timeout):
                print("Database connection established.")
                break
        except socket.error as ex:
            print(f"Waiting for database connection: {ex}")
            time.sleep(5)
            if time.time() - start_time > timeout:
                print("Database connection timed out.")
                break

wait_for_db()
END

python manage.py makemigrations
python manage.py migrate --no-input
python manage.py collectstatic --no-input

python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('dragos', 'dragos.badiu.a@hotmail.com', 'Maudeg12.34') if not User.objects.filter(username='dragos').exists() else print('Superuser already exists.')"

waitress-serve --port=8000 backend.wsgi:application