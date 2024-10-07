FROM ubuntu:24.04

RUN apt update&& apt install -y \
    python3\
    python3-pip\
    python3-venv\
    mysql-client\
    nginx\
    && apt clean

WORKDIR /app
COPY . /app

RUN python3 -m venv venv
RUN . /app/venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD service nginx start && . /app/venv/bin/activate && python manage.py migrate && python manage.py runserver 0.0.0.0:8000