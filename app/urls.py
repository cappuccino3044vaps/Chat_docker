# counter/urls.py
from django.urls import path
from .views import index, increment_count

urlpatterns = [
    path('', index, name='index'),
    path('increment/', increment_count, name='increment_count'),
]
