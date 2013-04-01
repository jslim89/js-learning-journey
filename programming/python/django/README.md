# Lessons

## URL configure get 404
First, the URL file will be loaded by setting in **project_dir/project/settings.py**
```py
ROOT_URLCONF = 'project.urls'
```

Assumed that you already have an app named **myapp**

Include the URL config file from your app

Edit **project_dir/project/urls.py**
```py
...
urlpatterns = patterns('',
    ...
    # This is to include the urls.py from myapp
    # if you add a trailing slash, will get 404 error
    # i.e. (r'^$/', include('myapp.urls')),
    (r'^$', include('myapp.urls')),
    ...
)
...
```

Reference: [URL dispatcher](https://docs.djangoproject.com/en/dev/topics/http/urls/)
