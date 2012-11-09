# Lessons

## Mount from remote windows server (windows share)

1. Login as root
```sh
$ su -
```
2. Create a mount point
```sh
# mkdir -p /mnt/ntserver
```
3. Mount the server
```sh
# mount -t cifs //192.168.1.100/folder_to_be_mount -o username=jslim89,password=passwd /mnt/ntserver
```

**NOTE**
* `-t cifs` - File system type to be mount
* `-o` - in order to pass in arguments (i.e. **username** and **password**)

Reference: [How to mount remote windows partition (windows share) under Linux] (http://www.cyberciti.biz/tips/how-to-mount-remote-windows-partition-windows-share-under-linux.html)

## GREP exclude certain keyword
```sh
$ grep "*wanted*" -v "*dontWant*" *
```
In this case it will match the keyword **wanted** but exclude all the word with **dontWant**  

`-v` option is for excluding what you don't want

Reference: [Using grep to Exclude Lines Containing Certain Characters/Text] (http://droptips.com/using-grep-to-exclude-lines-containing-certain-characterstext)

## find exclude certain filename
```sh
$ find . -not -iname "*dontWant*" -iname "*wanted*"
```
In this case it will match the filename with the word **wanted** but exclude those with the word **dontWant**  

Reference: [How do you exclude files in the find command] (http://www.linuxforums.org/forum/programming-scripting/66523-how-do-you-exclude-files-find-command.html#post354455)

## svn commit excluding those files you haven't done
```sh
$ svn st | grep -v Foo | cut -c9- | xargs svn commit
```
`svn st` - show the files that have been modified  
`grep -v Foo` - exclude those file path with the word **Foo**  
`cut -c9-` - to remove the extra character in front. i.e.  
`M          ./path/to/Foo/bar.php`  
after `cut` become **./path/to/Foo/bar.php**  
`xargs svn commit` - pass the output from command in front to `svn commit`

Reference: [how to loop files in linux from svn status] (http://stackoverflow.com/questions/289626/how-to-loop-files-in-linux-from-svn-status#answers)

## Change "localhost" to other name
```sh
$ vi /etc/sysconfig/network
```
Just change from here

## echo with new line character
```sh
$ echo -e [ui]\nusername = Your Name <your@email.com>
```
which will produce:  
```conf
[ui]
username = Your Name <your@email.com>
```
`-e` - is to enable intepretation of backslash escapes (i.e. **\n** in this case)

Reference: [new line in echo] (http://www.unix.com/shell-programming-scripting/56666-new-line-echo.html#post302271720)

## Change password for other users
```sh
$ sudo passwd userfoo
```

Reference: [PostgreSQL default password] (http://mohsinpage.wordpress.com/2011/01/20/postgresql-default-password/)

## Display size of directory
```sh
$ du -ch /path/to/dir | grep total
```

Reference: (http://www.codecoffee.com/tipsforlinux/articles/22.html)

## Start SSH server on bootup
```sh
$ su -c 'chkconfig sshd on'
```

## yum install without gpg-key
`# yum install --nogpgcheck package-name`

## replace pattern with sed
Example: replace `window.location.reload('#page1#&#page2#')` to `window.location.href='#page1#&#page2#';`  
```sh
$ sed -i "s/reload('#\(\w\+\)#&#\(\w\+\)#')/href='#\1#\&#\2#';/" /path/to/file
```

**NOTE:** the `&` in the _destination_ must use `\` to escape, otherwise it will refer to the _source_  
i.e. `$ sed -i "s/reload('#\(\w\+\)#&#\(\w\+\)#')/href='#\1#&#\2#';/" /path/to/file`  
will be come `window.location.href='#choosepage#reload('#choosepage#&#queryString#')#queryString#';`

Replace all occurance in a directory  
```sh
$ grep "reload" -Rl * | xargs sed -i "s/reload('#\(\w\+\)#&#\(\w\+\)#')/href='#\1#\&#\2#';/"
```

**Assumption:** `reload` keyword only occur in this situation.  
`-R` - recursively looking for all files in sub-directories
`-l` - show only the filename

## Sync 2 directories using rsync
```sh
$ rsync -vr /path/to/source/ /path/to/destination/
```
* `-v` - verbose
* `-r` - recursive

Reference: [How to Backup Linux? 15 rsync Command Examples] (http://www.thegeekstuff.com/2010/09/rsync-command-examples/)

## Forward & Backward search in bash
`CTRL + R` - backward search  
`CTRL + S` - forward search **(Use after typing _CTRL + R_)**  
If `CTRL + S` doesn't work, use the command below:

```sh
$ stty stop ^J
```

Reference: [How to forward-search-history with the reverse-i-search command (ctrl+r)?] (http://askubuntu.com/questions/60071/how-to-forward-search-history-with-the-reverse-i-search-command-ctrlr#answers)

## Remove the trailing dot behind the permission drwxrwxrwx
```sh
$ find /path/to/dir -print0 | xargs -0 -n 1 sudo setfattr -h -x security.selinux
```

_The last character can be:_
` ` **(Blank)** - no SELinux coverage
`.` **(dot)** - ordinary SELinux context only
`+` **(plus)** - SELinux ACLs or other things beyond ordinary context

![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/linux/images/permission_trailing_dot.png "Permission trailing dot")  

Reference: [what's with that trailing "." for the mode from "ls -l"] (http://lists.fedoraproject.org/pipermail/users/2009-November/092469.html)

## Debugging in Apache configuration
Recently I faced a problem faced a problem in Fedora 17. [Here] (http://serverfault.com/questions/444629/getting-403-on-apache-with-php-on-fedora-17/446570) is the question that I post to serverfault.com.

If you faced 403 status in your browser, please check the following:

1. Permission for your `/home/user` and subdirectories to your project if you're using symbolic link
2. Check your httpd.conf file
    - `AllowOverride None` change to `AllowOverride All` to enable `.htaccess`
    - `Options Indexes FollowSymLinks` make sure that `FollowSymLinks` is there if you're using symbolic link

**NOTE:** For the **2**, the configuration is in document root,  
i.e.
```conf
<Directory "/var/www/html">
    Options Indexes FollowSymLinks
    AllowOverride All
    Order allow,deny
    Allow from all
</Directory>
```

Credit: [Kian-Meng, Ang] (https://github.com/kianmeng)

## awk usage
Extract out certain portion of input by a separator
```sh
$ echo "hello to awk" | awk '{print $3}'
```
The output will be `awk`.  
**By default it will separated by a _\<space\>_ character**
```sh
$ echo "hello_to_awk" | awk -F _ '{print $3}'
```
`-F` - specify **separator** instead of using **\<space\>** by default

Reference: [simple awk tutorial] (http://www.hcs.harvard.edu/~dholland/computers/awk.html)
