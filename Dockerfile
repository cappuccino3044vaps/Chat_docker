FROM ubuntu:24.04

RUN apt update&& apt install -y \
    python3\
    python3-pip\
    python3-venv\
    mysql-client\
    libmysqlclient-dev\
    nginx\
    && apt clean

WORKDIR /app
COPY . /app
RUN python3 -m venv venv
# 仮想環境をアクティベートするための設定
ENV PATH="/app/venv/bin:$PATH"
RUN . /app/venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

# Create an entrypoint script to run everything
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Use the entrypoint script to start Nginx and the Django app
CMD ["/app/entrypoint.sh"]