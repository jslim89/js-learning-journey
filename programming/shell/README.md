# Lessons

## Check is variable empty
```sh
if [[ -z $myvar ]]; then
    echo "myvar is empty"
else
    "myvar is $myvar"
fi
```

Reference: [bash test for empty string with X“” [duplicate]](http://stackoverflow.com/questions/6852612/bash-test-for-empty-string-with-x/6853353#6853353)

## Get current executable filename
```sh
echo "current filename is `basename $0`"
```

Reference: [How do I know the script file name in a Bash script?](http://stackoverflow.com/questions/192319/how-do-i-know-the-script-file-name-in-a-bash-script/192337#192337)

## Get first file in a directory
```sh
ls *.php | head -1
```

Reference: [Bash script to find the first file in a directory.](http://ubuntuforums.org/showthread.php?t=1506946&p=9443985#post9443985)

## Get modified date (in unix timestamp) of a file
```sh
echo `stat -f "%m" myfile.php`
```

Reference: [me last modification date shell in script](http://stackoverflow.com/questions/11212663/filename-last-modification-date-shell-in-script/11216144#11216144)

## Get the latest files in a directory
```sh
# Get the first file of a directory
latest_file=`ls /path/to/your/files/*.php | head -1`
# loop through all files
for f in /path/to/your/files/*.php; do
    # compare the file last modified date
    if [ `stat -f "%m" $f` -gt `stat -f "%m" $latest_file` ]; then
        latest_file=$f
    fi
done
echo "latest file $latest_file : `stat -f "%m" $latest_file`"
```

Reference: [Comparing numbers in bash](http://stackoverflow.com/questions/18668556/comparing-numbers-in-bash/18668580#18668580)

## Check is directory exists
```sh
if [ -d "$DIRECTORY" ]; then
  echo $DIRECTORY exists
fi
```

Or

```sh
if [ ! -d "$DIRECTORY" ]; then
  echo $DIRECTORY not exists
fi
```

Reference: [How to check if a directory exists in a shell script](http://stackoverflow.com/questions/59838/how-to-check-if-a-directory-exists-in-a-shell-script/59839#59839)

## Multiple condition in `if` statement
Example below shows to get some folders in current directory and exclude some of that
```sh
#!/bin/bash
for x in ./*; do
    if [ -d $x ]; then # Only get the directory
        proj=`basename $x`;
        if [[ $proj == "excluded_1" || $proj == "excluded_2" || $proj == "excluded_3" ]]; then
            continue
        fi
        echo $proj;
    fi
done
```

**NOTE: for multiple conditions, must use double bracket**

References:

- [how to represent multiple conditions in shell script?](http://stackoverflow.com/questions/3826425/how-to-represent-multiple-conditions-in-shell-script/3826705#3826705)
- [How to use double or single bracket, parentheses, curly braces](http://stackoverflow.com/questions/2188199/how-to-use-double-or-single-bracket-parentheses-curly-braces/2188369#2188369)

## Get current directory
```sh
currdir="`dirname $0`"
```

Reference: [Can a Bash script tell what directory it's stored in?](http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in/246128#246128)
