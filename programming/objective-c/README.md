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
```obj-c
NSLog(@"%@", obj);
```

Reference: [How to dump data stored in objective-c object (NSArray or NSDictionary)](http://stackoverflow.com/questions/289241/how-to-dump-data-stored-in-objective-c-object-nsarray-or-nsdictionary#answers)

## Type casting
Cast `bar` to `NSWhatEver` object into `foo` variable
```obj-c
NSWhatEver *foo = (NSWhatEver *)bar;
```

Reference: [Casting Objects in Cocoa touch](http://stackoverflow.com/questions/960513/casting-objects-in-cocoa-touch#answers)

## Accessing a `deep` element in JSON
```obj-c
/*
{
    lvl_1_0 =     {
        lvl_2_0 =         {
            lvl_3_0 = "I'm Foo";
            lvl_3_1 = "I'm Bar";
        };
        lvl_2_1 = 123;
    };
    lvl_1_1 =     (
    );
}
*/

NSString *foo = [[[json valueForKey:@"lvl_1_0"] valueForKey:@"lvl_2_0" ] valueForKey:@"lvl_3_0"];
```

## Clear all cookies
```obj-c
NSString baseUrlString = @"http://yourdomain.com/";
NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: [NSURL URLWithString:baseUrlString]];
for (NSHTTPCookie *cookie in cookies) {
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
}
```

Reference: [How to manage sessions with AFNetworking?](http://stackoverflow.com/questions/10984374/how-to-manage-sessions-with-afnetworking#answers)

## Clear all NSUserDefaults
```obj-c
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
NSDictionary *dict = [defaults dictionaryRepresentation];
for (id key in dict) {
    [defaults removeObjectForKey:key];
}
[defaults synchronize];
```

Reference: [Delete all keys from a NSUserDefaults dictionary iPhone](http://stackoverflow.com/questions/6797096/delete-all-keys-from-a-nsuserdefaults-dictionary-iphone#answers)
