FROM ubuntu:24.04

RUN apt update&& apt install -y \
    python3\
    python3-pip\
    python3-venv\
    mysql-client\
    libmysqlclient-dev\
    nginx\
    && apt clean

WORKDIR /APP_DIR
COPY . /APP_DIR
RUN python3 -m venv venv
# 仮想環境をアクティベートするための設定
ENV PATH="/APP_DIR/venv/bin:$PATH"
RUN /APP_DIR/venv/bin/pip install --upgrade pip && /APP_DIR/venv/bin/pip install -r requirements.txt

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

# Create an entrypoint script to run everything
COPY entrypoint.sh /APP_DIR/entrypoint.sh
RUN chmod +x /APP_DIR/entrypoint.sh

# Use the entrypoint script to start Nginx and the Django app
CMD ["/APP_DIR/entrypoint.sh"]