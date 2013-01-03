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

## Add objects into NSMutableDictionary
```obj-c
NSMutableDictionary *arrayObj = [[NSMutableDictionary alloc] init];
for (int i = 0; i < 10; i++) {
    [arrayObj setObject:[NSString stringWithFormat:@"Row %d", i] forKey:[NSString stringWithFormat:@"key_%d", i]];
}
```

Reference: [How to addObject of NSMutableDictionary to NSMutableArray in a loop](http://stackoverflow.com/questions/1957883/how-to-addobject-of-nsmutabledictionary-to-nsmutablearray-in-a-loop#answer-7432535)

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

## Property creation
**FooViewController.h**
```obj-c
@interface FooViewController : UIViewController

@property (strong, nonatomic) NSString *fooStr;
# primitive type no need to specify strong or weak
@property (nonatomic) int fooInt;

@end
```

**FooViewController.m**
```obj-c
@implementation FooViewController { }

@synthesize fooStr;
@synthesize fooInt;

...
- (void)viewDidUnload
{
    // Deallocate object reference type
    [self setFooStr:nil];
    [super viewDidUnload];
}
@end
...
```
This can be apply in such a situation where you want to let the next view to access your property

## Dismiss `presentModalViewController`
i.e. **Cancel** button is clicked, want to dismiss itself
```obj-c
[self dismissModalViewControllerAnimated:YES];
```

Reference: [present and dismiss modal view controller](http://stackoverflow.com/questions/1529632/present-and-dismiss-modal-view-controller#answers)

## UILabel setFont
```obj-c
[fooLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:16]];
```

Reference: [I want to make UILabel's text bold](http://stackoverflow.com/questions/4602586/i-want-to-make-uilabels-text-bold#answers)

## UILabel center text alignment
```obj-c
fooLabel.textAlignment = UITextAlignmentCenter;
```

Reference: [UILabel Align Text to center](http://stackoverflow.com/questions/5722730/uilabel-align-text-to-center#answers)

## Get device model
```obj-c
- (NSString *)model
{
    struct utsname systemInfo;
    uname(&systemInfo);

    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}
```

Reference: [ios iphone get device model and make?](http://stackoverflow.com/questions/11197509/ios-iphone-get-device-model-and-make#answers)

## Get user location
First, add a framework named **CoreLocation.framework**

![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/add-core-location-framework-to-project.png "Add CoreLocation.framework")  

In **FooViewController.h**
```obj-c
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FooViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}

@end
```

In **FooViewController.m**
```obj-c
...
- (void)viewDidLoad
{
    ...
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    ...
}

...
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Old location: %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    NSLog(@"New location: %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
}
...
```

Reference: [How can I get current location from user in iOS](http://stackoverflow.com/questions/4152003/how-can-i-get-current-location-from-user-in-ios#answer-11334031)

## Add beep sound
```obj-c
#import <AudioToolBox/AudioToolBox.h>

...
- (void)viewDidLoad
{
    # more sound refer to http://iphonedevwiki.net/index.php/AudioServices
    AudioServicePlaySystemSound(1000);
}
...
```

Reference: [has Iphone built in beep sound efect](http://stackoverflow.com/questions/5867058/has-iphone-built-in-beep-sound-efect#answers)

## Bind `Return` button to UITextField
In **FooViewController.h**
```obj-c
@interface FooViewController : UIViewController <UITextFieldDelegate>
```

In **FooViewController.m**
```obj-c
- (void)viewDidLoad
{
    ...
    UITextField *textField = [[UITextField alloc] initWithFrame:...];
    ...
    textField.delegate = self;
    ...
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // Un-focus the text field
    [textField resignFirstResponder];
    return YES;
}
```

Reference: [How to make return key on iphone make keyboard disappear?](http://stackoverflow.com/questions/6190276/how-to-make-return-key-on-iphone-make-keyboard-disappear#answers)

## Change keyboard `Return` key to `Go`
```obj-c
[textField setReturnKeyType:UIReturnKeyGo];
```

Reference: [iOS keyboard with “Go” button instead of return](http://stackoverflow.com/questions/4489879/ios-keyboard-with-go-button-instead-of-return#answers)

## Delegate multiple UITextField
In **FooViewController.m**
```obj-c
#import "FooViewController.h"

#define TEXTFIELD_FOO 1
#define TEXTFIELD_BAR 2

@interface FooViewController()

@end

@implementation FooViewController
...
- (void)viewDidLoad
{
    ...
    UITextField *fooTextField = [[UITextField alloc] initWithFrame:...];
    ...
    fooTextField.tag = TEXTFIELD_FOO;
    fooTextField.delegate = self;
    ...
    UITextField *barTextField = [[UITextField alloc] initWithFrame:...];
    ...
    barTextField.tag = TEXTFIELD_BAR;
    barTextField.delegate = self;
    ...
}
...
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == TEXTFIELD_FOO) {
        // do something with Foo
    } else if (textField.tag == TEXTFIELD_BAR) {
        // do something with Bar
    }
    return YES;
}
```

Reference: [iphone: uitextfield, multiple textfields with the same delegate?](http://stackoverflow.com/questions/3747315/iphone-uitextfield-multiple-textfields-with-the-same-delegate#answers)

## UIScrollView scroll as page
The statement below will enable the paging like what you see in iPhone menu (cannot scroll half page)
```obj-c
scrollView.pagingEnabled = YES;
```
