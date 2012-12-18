# Lessons

## String casting
```obj-c
int num = 1;
NSString *str = [NSString stringWithFormat:@"This is string type: %d", num];
```
will output
```
This is string type: 1
```

Reference: [Casting an int to an NSString *](http://forums.macrumors.com/showthread.php?t=448594#post5105590)

## Dump object in console
```objc
NSLog(@"%@", obj);
```

Reference: [How to dump data stored in objective-c object (NSArray or NSDictionary)](http://stackoverflow.com/questions/289241/how-to-dump-data-stored-in-objective-c-object-nsarray-or-nsdictionary#answers)
