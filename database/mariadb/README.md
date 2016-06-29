# Lessons

## mysqld start failed

```
$ sudo rm /var/lib/mysql/{ib_logfile0,ib_logfile1,aria_log_control}
$ sudo /etc/init.d/mysql restart
```

Reference: [Cannot start mysqld after switching to MariaDB](http://wood1978.dyndns.org/~wood/wordpress/2013/03/26/cannot-start-mysqld-after-switching-to-mariadb/)
