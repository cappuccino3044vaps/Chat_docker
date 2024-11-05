# counter/views.py
from django.shortcuts import render
from .models import PageView

def page_view_counter(request):
    # レコードがなければ初期化
    view, created = PageView.objects.get_or_create(id=1)
    view.count += 1  # アクセス回数を増加
    view.save()

    return render(request, 'counter.html', {'count': view.count})