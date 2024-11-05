from django.urls import path

from . import views


app_name = 'djangoapp'
urlpatterns = [
    path('', views.page_view_counter, name="counter"),
]
