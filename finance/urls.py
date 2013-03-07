from django.conf.urls import patterns, include, url
from django.conf import settings

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Product
    url(r'^$', 'products.views.product'),
    url(r'^product/(?P<id>\d+)/$', 'products.views.product_item'),
    url(r'^product/new/$', 'products.views.product_new'),
    url(r'^product/delete/(?P<id>\d+)/$', 'products.views.product_delete'),
    url(r'^product/status/(?P<id>\d+)/(?P<status>\d+)/$', 'products.views.product_status'),
    # Product Type
    url(r'^type/$', 'products.views.type'),
    url(r'^type/(?P<id>\d+)/$', 'products.views.type_item'),
    url(r'^type/new/$', 'products.views.type_new'),
    url(r'^type/delete/(?P<id>\d+)/$', 'products.views.type_delete'),
    # Login
    url(r'^login/$', 'django.contrib.auth.views.login', {'template_name': 'login.html'}),
    url(r'^logout/$', 'django.contrib.auth.views.logout_then_login', {'login_url': '/login/'}),
    # url(r'^finance/', include('finance.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    # (r'^admin/(.*)', admin.site.root),
)

urlpatterns += patterns('django.contrib.staticfiles.views',
        url(r'^static/(?P<path>.*)$', 'serve'),
    )

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT})
    )