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
