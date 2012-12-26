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

## Define global constant
Create 2 files:
```sh
$ touch Constants.h
$ touch Constants.m
```
Add the 2 files to project, **right-click** the project -> **Add Files to "project"...**  
![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/add-files-to-project.png "Add Files to 'project'...")  

Edit the files:

**Constants.h**
```obj-c
FOUNDATION_EXPORT NSString *const FOO;
FOUNDATION_EXPORT NSString *const BAR;
```

**Constants.m**
```obj-c
NSString *const FOO = @"I'm Foo";
NSString *const BAR = @"I'm Bar";
```
Then import to those files that you want to use these constants
```obj-c
import "Constants.h"
```

Reference: [Constants in Objective C](http://stackoverflow.com/questions/538996/constants-in-objective-c#answers)

## Add objects into NSMutableArray
```obj-c
NSMutableArray *arrayObj = [[NSMutableArray alloc] init];
for (int i = 0; i < 10; i++) {
    [arrayObj addObject:[NSString stringWithFormat:@"Row %d", i]];
}
```

Reference: [NSArray adding elements](http://stackoverflow.com/questions/778465/nsarray-adding-elements#answers)

## set border to image
```obj-c
#import <QuartzCore/QuartzCore.h>

UIImageView *imageView = [[UIImageView alloc] init];
[imageView.layer setBorderColor:[[UIColor blackColor] CGColor]];
[imageView.layer setBorderWidth:2.0];
```

Reference: [How can i take an UIImage and give it a black border?](http://stackoverflow.com/questions/1354811/how-can-i-take-an-uiimage-and-give-it-a-black-border#answer-3018485)

## Generate Unix timestamp
```obj-c
int timestamp = [[NSDate date] timeIntervalSince1970];
```

Reference: [UnixTimestamps always off in ios](http://stackoverflow.com/questions/8639048/unixtimestamps-always-off-in-ios#answers)

## Hide the navigation bar
Consider a situation here, a 2nd layer view is pushed on top of the root view, where root view need a navigation bar and the view just pushed no need.

In root navigation viewController.m
```obj-c
- (void)viewWillAppear:(BOOL)animated
{
    # show navigation bar when the root view is shown
    [self.navigationController setNavigationBarHidden:NO];
}
- (IBAction)toNextView:(id)sender
{
    # push a new view in
    YourViewController *controller = [[YourViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    # hide the navigation bar
    [self.navigationController setNavigationBarHidden:YES];
}
```

Reference: [Hide navigation bar in UINavigationViewController's root view, but show it in others](http://stackoverflow.com/questions/8620491/hide-navigation-bar-in-uinavigationviewcontrollers-root-view-but-show-it-in-ot#answers)
