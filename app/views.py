# counter/views.py
from django.shortcuts import render
from django.http import JsonResponse
from .models import ClickCount
from datetime import date

def index(request):
    # 今日の日付のレコードを取得または作成
    click_count, created = ClickCount.objects.get_or_create(date=date.today())
    return render(request, 'counter/index.html', {'click_count': click_count})

def increment_count(request):
    # 今日の日付のレコードを取得
    click_count = ClickCount.objects.get(date=date.today())
    click_count.count += 1  # カウントをインクリメント
    click_count.save()  # 保存
    return JsonResponse({'count': click_count.count})  # JSONレスポンスとして返す
