## Laragon setup laravel always enforce no trailing slash

To allow optional trailing slash, change the nginx settings

```
rewrite ^([^.]*[^/])$ $1/ permanent;
```
