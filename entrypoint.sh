#!/bin/bash
# Start Nginx in the background
service nginx start

# Activate the virtual environment
. /app/venv/bin/activate

# Apply Django migrations
python manage.py migrate

# Start the Django app
exec python manage.py runserver 0.0.0.0:8000