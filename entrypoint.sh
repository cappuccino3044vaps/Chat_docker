#!/bin/sh
python manage.py makemigrations --noinput
python manage.py migrate --noinput
# スーパーユーザーを自動作成
echo "from django.contrib.auth import get_user_model; \
User = get_user_model(); \
User.objects.filter(username='${DJANGO_SUPERUSER_USERNAME}').exists() or \
User.objects.create_superuser('${DJANGO_SUPERUSER_USERNAME}', '${DJANGO_SUPERUSER_EMAIL}', '${DJANGO_SUPERUSER_PASSWORD}')" | python manage.py shell
python manage.py collectstatic --noinput
# 環境変数のDEBUGの値がTrueの時はrunserverを、Falseの時はgunicornを実行します
if [ $DEBUG = "True" ]
then
    python manage.py runserver 0.0.0.0:8000
else
    # gunicornを起動させる時はプロジェクト名を指定します
    # 今回はdjangopjにします
    gunicorn djangopj.wsgi:application --bind 0.0.0.0:8000
fi

