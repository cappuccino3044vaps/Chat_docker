from django.db import models

class PageView(models.Model):
    count = models.IntegerField(default=0)

    def __str__(self):
        return f"Count: {self.count}"