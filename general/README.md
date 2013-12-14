# Lesson

## Apache configuration lexerin markdown

```
```apache
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName local.foo.com
    ServerAlias local.foo.com
    DocumentRoot /home/user/public_html/foo
    SetEnv APPLICATION_ENV "development"

    <Directory "/home/user/public_html/foo/">
        DirectoryIndex index.php
        Options All
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log

    LogLevel warn

    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
```

More lexers can found in [Pygments available lexers](http://pygments.org/docs/lexers/)
