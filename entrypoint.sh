#!/bin/bash
# Start Nginx in the background
service nginx start

# Activate the virtual environment
. /APP_DIR/venv/bin/activate

# Apply Django migrations
python /APP_DIR/app/manage.py migrate

# Start the Django app
exec python /APP_DIR/app/manage.py runserver localhost:8000