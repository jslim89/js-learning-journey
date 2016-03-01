# Lessons

## Update memory limit

```
<IfModule mod_rewrite.c>
    # ...

    # php.ini override
    php_value max_execution_time 300
    php_value memory_limit 512M
</IfModule>
```
