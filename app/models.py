# counter/models.py
from django.db import models

class ClickCount(models.Model):
    date = models.DateField(auto_now_add=True, unique=True)  # 日付ごとにユニークなレコード
    count = models.IntegerField(default=0)  # クリック数

    def __str__(self):
        return f"{self.date}: {self.count} clicks"
