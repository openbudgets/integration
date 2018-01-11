"""microsite_backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from vizmanager.admin import ma_site
import vizmanager


admin.site.site_header = 'OpenBudgets Microsite Manager'
admin.site.site_title = 'Microsite Manager'
admin.site.index_title = 'Microsite Manager'
app_name = 'microsite'
urlpatterns = [
    url(r'^/admin/', admin.site.urls),
    url(r'^/manage/', ma_site.urls),
    url(r'^/vizmanager/', include('vizmanager.urls', namespace='vizmanager')),
]

urlpatterns += staticfiles_urlpatterns()
