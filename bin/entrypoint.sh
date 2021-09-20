#!/bin/bash
echo "-----> Making migrations of django apps"
python manage.py makemigrations   
echo "-----> Migrating django apps"
python manage.py migrate   
echo "-----> Populating model history"
python manage.py populate_history --auto
echo "-----> Collecting static files"
python manage.py collectstatic --noinput 
echo "-----> Compressing static files"
python manage.py compress
echo "-----> Launching gunicorn"
exec gunicorn --forwarded-allow-ips="*" --workers=3 --bind :$PORT tilerservice.wsgi 