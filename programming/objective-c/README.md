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
#import <sys/utsname.h>
...
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

## Change the height of UITableViewCell
```obj-c
- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.00;
}
```

Reference: [How can I programmatically increase the height of the cells in my UITableView?](http://stackoverflow.com/questions/3644366/how-can-i-programmatically-increase-the-height-of-the-cells-in-my-uitableview#answers)

## Set UITableViewCell background image 
```obj-c
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }

    cell.backgroundView = [[UIView alloc] init];
    cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"imgName"]];
    
    return cell;
}
```

## Set background on UIButton
I was curious that why the background is always there

![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/buttonWithUnclearedBackground.png "Ugly background")  

Finally I found the problem, is the `Type`, to create a button with background programmatically
```obj-c
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom]; // use custom instead of RoundedRect
[button setFrame:CGRectMake(position_x, position_y, width, height)];
[button setBackgroundImage:[UIImage imageNamed:@"SignInRegisterButton"] forState:UIControlStateNormal];
```

## Remove UITableView cell separator
```obj-c
tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
```

Reference: [How do I remove the borders of a UITableView?](http://stackoverflow.com/questions/286332/how-do-i-remove-the-borders-of-a-uitableview#answer-456945)

## Reset UIBarButtonItem background to default
**AppDelegate.m**
```obj-c
[[UIBarButtonItem appearance] setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
```

## Get `Day`, `Month`, `Year` from NSDate
```
NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit fromDate:[NSDate date]];
NSNumber *day = [NSNumber numberWithInt:[dateComponents day]];
NSNumber *month = [NSNumber numberWithInt:[dateComponents month]];
NSNumber *year = [NSNumber numberWithInt:[dateComponents year]];
```

Reference: [How to parse and extract Year, Month, Day etc from time interval on iphone IOS](http://stackoverflow.com/questions/8121147/how-to-parse-and-extract-year-month-day-etc-from-time-interval-on-iphone-ios#answers)

## Create UITableView programmatically
In **YourViewController.h**
```obj-c
#import <UIKit/UIKit.h>

@interface YourViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@end
```

Tell the compiler to conform to `UITableViewDelegate` & `UITableViewDataSource` these 2 protocols

In **YourViewController.m**
```obj-c
#import "YourViewController.h"

@interface YourViewController ()

@end

@implementation YourViewController {
        UITableView *tableView;
}
...

- (void)viewDidLoad
{
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.55f, self.view.frame.size.height * 0.2f, self.view.frame.size.width * 0.4f, self.view.frame.size.height * 0.7f) style:UITableViewStylePlain];

    // set the delegate & dataSource to self, means have to implement in YourViewController
    tableView.delegate = self;
    tableView.dataSource = self;

    [self.view addSubview:tableView];
}

...
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    // the number of section(s) in the table
    return 1;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    // the number of row(s) in the table
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // do some configuration like populate data to cell
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Action that you want to perform when clicked on table cell
}
```

## Validate phone number via Regex
```obj-c
    NSString *phoneNo = @"+6012-3456789";
    NSString *regex = @"^(\\+)?\\d+(-)?\\d+";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [stringTest evaluateWithObject:phoneNo];
```

* `^` Indicate beginning of the text
* `(\\+)?` Is an **optional** `+` character at the beginning of the text
* `\\d+` Indicate one or more integer
* `(-)?` An **optional** character

This will matches:

* +6012-3456789
* 012-3456789
* +60123456789
* 6012-3456789
* 60123456789

## Validate required text field
Should use
```obj-c
if (textField.text.length == 0) {
    // handle error
}
```
rather than
```obj-c
if ([textField.text isEqualToString:@""]) {
    // handle error
}
```
The second 1 won't work as it's default value is not an empty string, unless that you set
```obj-c
- (void)viewDidLoad
{
    [super viewDidLoad];
    textField.text = @"";
}
```
it's initial value.

Reference: [UITextField Initial Value](http://iphonedevsdk.com/forum/iphone-sdk-development/98995-uitextfield-initial-value.html#Comment_410476)

## Disable sleep
In your **AppDelegate.m**
```obj-c
...
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UIApplication sharedApplication].idleTimerDisabled = YES;
}
...
```

Reference: [How to Disable Sleep, but Enable Screen Dimming](http://iphonedevsdk.com/forum/iphone-sdk-development/34269-how-to-disable-sleep-but-enable-screen-dimming.html)

## Adding criteria to CoreData
```obj-c
NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
NSEntityDescription *entity = [NSEntityDescription entityForName:@"TableName" inManagedObjectContext:self.managedObjectContext];
[fetchRequest setEntity:entity];

NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:YES];
[fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescriptor]];

/* Add criteria here */
// for integer
[fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"theId == %d", 123]];
// for string
[fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"columnName CONTAINS[cd] %@", @"foo"]];

NSError *error;
NSArray *resultSet = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
if (resultSet == nil) {
    FATAL_CORE_DATA_ERROR(error);
}

NSLog(@"Result: %@", resultSet);
```

Reference: [NSPredicate compare with Integer](http://stackoverflow.com/questions/7540329/nspredicate-compare-with-integer/7540395#answers)

## Sentence to CamelCase
```obj-c
- (NSString *)camelCaseFromString:(NSString *)str
{
    return [[str capitalizedString] stringByReplacingOccurrencesOfString:@" " withString:@""];
}
```

Reference: [How to convert text to camel case in Objective-C?](http://stackoverflow.com/questions/6863096/how-to-convert-text-to-camel-case-in-objective-c/6863154#6863154)

## Add touch event to UIImageView
```obj-c
UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTouched:)];

UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
[imageView addGestureRecognizer:tap];
imageView.userInteractionEnabled = YES;
[self.view addSubview:imageView];

...

- (void)imageTouched:(UITapGestureRecognizer *)sender
{
    NSLog(@"Image tapped");
}
```

**NOTE: `imageView.userInteractionEnabled = YES` must be set, otherwise it won't work**

## NSArray check is object in array
```obj-c
NSArray *foo = [NSArray arrayWithObjects:obj1, obj2, obj3, nil];
BOOL isObj1InArray = [foo containsObject:obj1];
```

Reference: [in_array() for objective-c](http://iphonedevsdk.com/forum/iphone-sdk-development/29765-in_array-for-objective-c.html#Comment_128847)

## Set timeout interval
Set the interval to 60 seconds.
```obj-c
// must be NSMutableURLRequest, NSURLRequest doesn't has setTimeoutInterval this method
NSMutableURLRequest *request = [client requestWithMethod:@"GET" path:@"/foo" parameters:nil];
[request setTimeoutInterval:60];
```

Reference: [How to set a timeout with AFNetworking](http://stackoverflow.com/questions/8304560/how-to-set-a-timeout-with-afnetworking#answers)

## Compare CGRect
```obj-c
if (CGRectEqualToRect(someView.frame, anotherView.frame)) {
    NSLog(@"They are equal");
}
```

Reference: [Comparing two CGRects](http://stackoverflow.com/questions/12877496/comparing-two-cgrects#answers)

## Open browser when click on hyperlink in UIWebView
In your **FooViewController.h**, make sure it conform to WebView's protocol
```obj-c
#import <UIKit/UIKit.h>

@interface FooViewController : UIViewController <UIWebViewDelegate>

@end
```

In **FooViewController.m**, implement the delegate method
```obj-c
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // if a hyperlink is onclick, open browser
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        [[UIApplication sharedApplication] openURL:request.URL];
        return NO;
    }
    return YES;
}
```

Reference: [Launch Safari from UIWebview](http://iphonedevsdk.com/forum/iphone-sdk-development/17251-launch-safari-from-uiwebview.html#Comment_181401)

## Access property variable in closure
When you see a warning **Capturing 'self' strongly in this block is likely to lead to a retain cycle**, you can't access via **self** inside the block.
```obj-c
[self.coverImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[json valueForKeyPath:@"response.cover"]]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            
    self.coverImageView.image = image; // warning will be appeared here
} failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
}];
```

The solution is
```obj-c
__weak typeof(self) weakSelf = self;
[self.coverImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[json valueForKeyPath:@"response.cover"]]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            
    weakSelf.coverImageView.image = image;
} failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
}];
```

Reference: [capturing self strongly in this block is likely to lead to a retain cycle](http://stackoverflow.com/questions/14556605/capturing-self-strongly-in-this-block-is-likely-to-lead-to-a-retain-cycle#answer-14556706)

## Add a **Done** button to UISearchBar
```obj-c
// add Done button to keyboard
// dummy bar button just to make the Done button to right-hand-side
UIBarButtonItem *dummyBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(hideKeyboard:)];
[doneBarButton setStyle:UIBarButtonItemStyleDone];
UIToolbar *keyboardToolbar = [[UIToolbar alloc] init];
[keyboardToolbar setBarStyle:UIBarStyleBlackTranslucent];
[keyboardToolbar sizeToFit];
[keyboardToolbar setItems:[NSArray arrayWithObjects:dummyBarButton, doneBarButton, nil]];

self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
self.searchBar.delegate = self;
self.searchBar.placeholder = @"Search...";
// Access it subview (UITextField) and set the toolbar to it
// Since self.searchBar.inputAccessoryView = keyboardToolbar; will thrown error
for (UIView *subView in self.searchBar.subviews) {
    if ([subView conformsToProtocol:@protocol(UITextInputTraits)]) {
        UITextField *searchBarField = (UITextField *)subView;
        searchBarField.inputAccessoryView = keyboardToolbar;
        break;
    }
}
[self.view addSubview:self.searchBar];
```

Reference: [Issue with UISearchBar inputAccessoryView](http://stackoverflow.com/questions/12180457/issue-with-uisearchbar-inputaccessoryview#answer-12180620)

## Change UISearchBar **Search** button to **Done**
```obj-c

self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
self.searchBar.delegate = self;
self.searchBar.placeholder = @"Search...";
// Loop through all subviews in UISearchBar
for (UIView *searchBarSubview in [self.searchBar subviews]) {
    // Check if it is UITextField
    if ([searchBarSubview conformsToProtocol:@protocol(UITextInputTraits)]) {
        @try {
            // Change the title "Search" to "Done"
            [(UITextField *)searchBarSubview setReturnKeyType:UIReturnKeyDone];
            // set the style of keyboard
            [(UITextField *)searchBarSubview setKeyboardAppearance:UIKeyboardAppearanceAlert];
            // Enable the "Done" button eventhough no text in search bar
            [(UITextField *)searchBarSubview setEnablesReturnKeyAutomatically:NO];
        }
        @catch (NSException * e) {
            // ignore exception
        }
    }
}
[self.view addSubview:self.searchBar];
```

Reference: [iphone UISearchBar Done button always enabled](http://stackoverflow.com/questions/4728338/iphone-uisearchbar-done-button-always-enabled#answer-5552906)

## Remove all subviews from UIScrollView
```obj-c
[self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
```

Reference: [Remove all the subviews from a UIScrollView?](http://stackoverflow.com/questions/4102362/remove-all-the-subviews-from-a-uiscrollview#answer-4102431)

## Calculate visible "radius" from MKMapView
```obj-c
// get the center coordinate
CLLocationCoordinate2D centerCoor = [self.mapView centerCoordinate];
// get top left coordinate
CLLocationCoordinate2D topLeftCoor = [self.mapView convertPoint:CGPointMake(0, 0) toCoordinateFromView:self.mapView];

// init locations based on coordinates
CLLocation *centerLocation = [[CLLocation alloc] initWithLatitude:centerCoor.latitude longitude:centerCoor.longitude];
CLLocation *topLeftLocation = [[CLLocation alloc] initWithLatitude:topLeftCoor.latitude longitude:topLeftCoor.longitude];

// get the distance between 2 locations
CLLocationDistance radius = [centerLocation distanceFromLocation:topLeftLocation];

NSLog(@"Distance %.9f meters", radius);
```

Reference: [How to get left-top and right-buttom latitude and longitude of map in MapKit](http://stackoverflow.com/questions/1831634/how-to-get-left-top-and-right-buttom-latitude-and-longitude-of-map-in-mapkit#answer-1831660)

## Draw a circle image
This is basically just to draw a UIImage (circle) from code.
```obj-c
- (UIImage *)drawCircleWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextBeginPath(context);
    CGContextAddEllipseInRect(context, rect);
    CGContextDrawPath(context, kCGPathFillStroke); // Or kCGPathFill

    UIImage *circle = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return circle;
}
```

References:

* [drawing two circles using Quartz CGContextFillEllipseInRect](http://stackoverflow.com/questions/9684006/drawing-two-circles-using-quartz-cgcontextfillellipseinrect#answer-9684158)
* [iOS, Generated images, and masking](http://stackoverflow.com/questions/7141978/ios-generated-images-and-masking)

## Create rectangle UIImage programmatically
```obj-c
- (UIImage *)imageWithColor:(UIColor *)color inSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}
```

Reference: [Creating a UIImage from a UIColor to use as a background image for UIButton](http://stackoverflow.com/questions/6496441/creating-a-uiimage-from-a-uicolor-to-use-as-a-background-image-for-uibutton)

## Update text on a specific UITableViewCell
For example update, the fifth row in section 0
```obj-c
NSIndexPath *fifthRow = [NSIndexPath indexPathForRow:4 inSection:0];
UITableViewCell *cell = [tableView cellForRowAtIndexPath:fifthRow];
cell.textLabel.text = @"the updated text";
```

Reference: [UITableViewCell: How do I update textLabel.text at fifth row?](http://stackoverflow.com/questions/8227742/uitableviewcell-how-do-i-update-textlabel-text-at-fifth-row#answer-8227807)

## Remove last 2 character in NSMutableString
```obj-c
NSMutableString *str = [NSMutableString stringWithString:@"Item 1, Item 2, "];
[str deleteCharactersInRange:NSMakeRange([str length] - 2, 2)];
```

Result will be `Item 1, Item 2`

Reference: [Removing the last character from an NSMutableString](http://stackoverflow.com/questions/4675609/removing-the-last-character-from-an-nsmutablestring#answer-4675657)

## Get all checked UITableViewCell
```obj-c
// options is the dataSource for the tableView
for (int i = 0; i < [options count]; i++) {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        // perform action here
    }
}
```

Reference: [Selecting multiple rows of a UITableView](http://stackoverflow.com/questions/4430570/selecting-multiple-rows-of-a-uitableview)

## UIView get index of subview
Some time you might have some views is overlapping, when tapping a button, the 2 views will interchange, so you need to get the view's index to do comparison.
```obj-c
UIView *superView = [[UIView alloc] init];

UITableView *listView = [[UITableView alloc] initWithFrame:superView.bounds];
[superView addSubview:listView];

UITableView *gridView = [[UITableView alloc] initWithFrame:superView.bounds];
[superView addSubview:gridView];

int listViewIndex = [superView.subviews indexOfObject:listView];
int gridViewIndex = [superView.subviews indexOfObject:gridView];

// action here
```

Reference: [How to get UIView hierarchy index ??? (i.e. the depth in between the other subviews)](http://stackoverflow.com/questions/2343432/how-to-get-uiview-hierarchy-index-i-e-the-depth-in-between-the-other-subvi#answer-2343472)

## UINavigationBar change back bar button text
Let say there are 2 viewControllers, **FirstViewController** and **SecondViewController**

In **FirstViewController.m**
```obj-c
...
- (void)viewDidLoad
{
    // This must be put in FirstViewController rather than SecondViewController
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Your title"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:nil
                                                                            action:nil];
}
- (void)navigateToSecondView
{
    SecondViewController *controller = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}
...
```

When you navigate to **SecondViewController**, you will see `Your title` text appear in back button.

Reference: [UINavigationController “back button” custom text?](http://stackoverflow.com/questions/1441699/uinavigationcontroller-back-button-custom-text#answer-1441718)

## tableView:viewForFooterInSection VS tableView.tableFooterView
If you want the footer to keep at the end of table view (it will scroll together with table cell), then use `tableView.tableFooterView`

```obj-c
UIView *footerView = [[UIView alloc] initWithFrame:...];
[footerView addSubview:someView];

tableView.tableFooterView = footerView;
```

If you're using `tableView:viewForFooterInSection`, then the view will stay at bottom of your visible screen for that particular section.
```obj-c

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:...];
    ...
    [footerView addSubview:someView];

    return footerView;
}
```

Reference: [UITableView Footer, Stop from floating over content](http://stackoverflow.com/questions/5740518/uitableview-footer-stop-from-floating-over-content#answer-5751142)

## RSA - Convert `.pem` to `.der` format
```obj-c
NSString *startPublicKey = @"-----BEGIN PUBLIC KEY-----";
NSString *endPublicKey = @"-----END PUBLIC KEY-----";

// read .pem from file
NSString* path = [[NSBundle mainBundle] pathForResource:@"public_key"
                                                     ofType:@"pem"];
// get the content
NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
// remove the first line & end line
NSString *publicKey;
NSScanner *scanner = [NSScanner scannerWithString:content];
[scanner scanUpToString:startPublicKey intoString:nil];
[scanner scanString:startPublicKey intoString:nil];
[scanner scanUpToString:endPublicKey intoString:&publicKey];

// now this is in .der format
NSData *data = [NSData base64DataFromString:publicKey];
```

References:

* [Load public key from PEM file into NSData](http://stackoverflow.com/questions/16865466/load-public-key-from-pem-file-into-nsdata#answer-16868667)
* [ASN.1 key structures in DER and PEM](https://polarssl.org/kb/cryptography/asn1-key-structures-in-der-and-pem)

## Storing Custom object to NSUserDefaults
Let say you have an object **Foo**

**Foo.h**
```obj-c
#import <Foundation/Foundation.h>

// conform to NSCoding
@interface Foo : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;

@end
```

**Foo.m**
```obj-c
#import "Foo.h"

@implementation Foo

@synthesize name = _name;
@synthesize desc = _desc;

// implement this 2 methods
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.desc forKey:@"Desc"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.name = [aDecoder decodeObjectForKey:@"Name"];
    self.desc = [aDecoder decodeObjectForKey:@"Desc"];
    
    return self;
}
```

Now you can **save** your objects to NSUserDefaults
```obj-c
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
NSMutableArray *arr = ... ; // set value
NSData *data = [NSKeyedArchiver archivedDataWithRootObject:arr];
[defaults setObject:data forKey:@"theKeyInUserDefaults"];
```

and **load** it from NSUserDefaults
```obj-c
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
NSData *data = [defaults objectForKey:@"theKeyInUserDefaults"];
NSArray *arr = [NSKeyedUnarchiver unarchiveObjectWithData:data];
```

Reference: [Why NSUserDefaults failed to save NSMutableDictionary in iPhone SDK?](http://stackoverflow.com/questions/471830/why-nsuserdefaults-failed-to-save-nsmutabledictionary-in-iphone-sdk/471920#471920)

## Compare NSObject
Override the `hash` & `isEqual` methods

```obj-c
- (NSUInteger)hash
{
    NSUInteger prime = 31;
    NSUInteger result = 1;
    
    // for object
    result = prime * result + [self.name hash];

    // for primitive type
    result = prime * result + self.amount;

    // for 64bit
    result = prime * result + (int) (self.data64bit ^ (self.data64bit >>> 32));

    // for boolean
    result = prime * result + (self.isCorrect) ? 1231 : 1237;

    return result;
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    return [self hash] == [object hash];
}
```

Reference: [Best practices for overriding isEqual: and hash](http://stackoverflow.com/questions/254281/best-practices-for-overriding-isequal-and-hash)

## Change textLabel color of UITableViewCell in `selected` state
```obj-c
cell.textLabel.highlightedTextColor = [UIColor whiteColor];
```

Reference: [iPhone: How to change font color in UITableViewCell when selected?](http://stackoverflow.com/questions/6736618/iphone-how-to-change-font-color-in-uitableviewcell-when-selected/6736711#6736711)

## Rate Us: Open in AppStore
```obj-c
NSURL *rateUrl = [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=%@&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software", @"YOUR_APP_ID_HERE"]];

[[UIApplication sharedApplication] openURL:rateUrl];
```

Reference: [App store link for “rate/review this app”](http://stackoverflow.com/questions/3124080/app-store-link-for-rate-review-this-app/3167015#3167015)

## Add shadow to view without gradient

![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/shadow-without-gradient.png "Shadow without gradient")

To add a shadow to UINavigationBar like image above
```obj-c
// set shadow below
self.navigationController.navigationBar.layer.shadowRadius = 0;
self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(0, 4);
self.navigationController.navigationBar.layer.shadowOpacity = 1;
self.navigationController.navigationBar.layer.shadowColor = [UIColor colorWithWhite:0.8 alpha:0.8f].CGColor;
self.navigationController.navigationBar.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.navigationController.navigationBar.bounds].CGPath;
```

Reference: [Shadow in UIView without gradient ?](http://stackoverflow.com/questions/17539323/shadow-in-uiview-without-gradient/17539564#17539564)

## Resign any first responder
Some time we just want to hide the keyboard when clicked on a button, but we might not know which textField is currently showing keyboard. The line below will just resign any responder.

```obj-c
[self.view endEditing:YES];
```

Reference: [Get the current first responder without using a private API](http://stackoverflow.com/questions/1823317/get-the-current-first-responder-without-using-a-private-api/2887690#2887690)

## Loop through NSDictionary
```obj-c
NSDictionary *dict = ...;
for (NSString *key in dict) {
    id value = [dict objectForKey:key];
    // do stuff
}
```

Reference: [for each loop in objective c for accessing NSMutable dictionary](http://stackoverflow.com/questions/2143372/for-each-loop-in-objective-c-for-accessing-nsmutable-dictionary/2143389#2143389)

## UINavigationBar in iOS7 overlap the main content view issue

![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/ios-7-navigationbar.png "NavigationBar overlapping") 
![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/ios-7-navigationbar-fixed.png "NavigationBar fixed")

In order to fix this, just add the line below

```obj-c
navigationController.navigationBar.translucent = NO;
```

Reference: [Status bar and navigation bar appear over my view's bounds in iOS 7](http://stackoverflow.com/questions/17074365/status-bar-and-navigation-bar-appear-over-my-views-bounds-in-ios-7)

## Draw UIImage from text
```obj-c
- (UIImage *)imageFromText:(NSString *)text
{
    // set the font type and size
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:12];
    CGSize size  = [text sizeWithFont:font];
    
    // check if UIGraphicsBeginImageContextWithOptions is available (iOS is 4.0+)
    if (UIGraphicsBeginImageContextWithOptions != NULL)
        UIGraphicsBeginImageContextWithOptions(size,NO,0.0);
    else
        // iOS is < 4.0
        UIGraphicsBeginImageContext(size);
    
    // optional: add a shadow, to avoid clipping the shadow you should make the context size bigger
    //
    // CGContextRef ctx = UIGraphicsGetCurrentContext();
    // CGContextSetShadowWithColor(ctx, CGSizeMake(1.0, 1.0), 5.0, [[UIColor grayColor] CGColor]);
    
    // set text color
    [[UIColor colorWithWhite:1 alpha:0.55] set];
    
    // draw in context, you can use also drawInRect:withFont:
    [text drawAtPoint:CGPointMake(0.0, 0.0) withFont:font];
    
    // transfer image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
```

Reference: [How do I use the NSString draw functionality to create a UIImage from text](http://stackoverflow.com/questions/2765537/how-do-i-use-the-nsstring-draw-functionality-to-create-a-uiimage-from-text/2768081#2768081)

## Change UINavigationBar style

In AppDelegate.m
```obj-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ...

    // change the font & text color
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                      [UIFont fontWithName:@"CustomFont-Bold" size:18], UITextAttributeFont,
                      [UIColor whiteColor], UITextAttributeTextColor,
                      // make the text FLAT
                      [UIColor clearColor], UITextAttributeTextShadowColor,
                      nil]];
    ...
}
```

This is same to `UIBarButtonItem`

Reference: [Change UINavigationBar font properties?](http://stackoverflow.com/questions/8774531/change-uinavigationbar-font-properties/12364740#12364740)

## UINavigationBar bar button image color for iOS7
In iOS7, even you set an image which is white color, it will automatic become blue color. This can change it by `tintColor`.

```obj-c
if ([[UIDevice currentDevice].systemVersion floatValue] >= 7) {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}
```
