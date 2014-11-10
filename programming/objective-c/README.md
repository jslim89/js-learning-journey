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

## NSDate & Unix timestamp
`NSDate` to timestamp
```obj-c
int timestamp = [[NSDate date] timeIntervalSince1970];
```

timestamp to `NSDate`
```obj-c
int timestamp = 1234567890;
NSDate *theDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
```

References:

* [UnixTimestamps always off in ios](http://stackoverflow.com/questions/8639048/unixtimestamps-always-off-in-ios#answers)
* [How to convert NSTimeInterval since1970 to NSDate](http://stackoverflow.com/questions/17365045/how-to-convert-nstimeinterval-since1970-to-nsdate/17365088#17365088)

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
- (UIImage *)imageWithColor:(UIColor *)color inSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    if (radius > 0) {
        UIGraphicsBeginImageContext(size);
        
        // Add a clip before drawing anything, in the shape of an rounded rect
        [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
        // Draw your image
        [img drawInRect:rect];
        img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    return img;
}
```

References:

* [Creating a UIImage from a UIColor to use as a background image for UIButton](http://stackoverflow.com/questions/6496441/creating-a-uiimage-from-a-uicolor-to-use-as-a-background-image-for-uibutton)
* [UIImage with rounded corners](http://stackoverflow.com/questions/10563986/uiimage-with-rounded-corners/10564035#10564035) 

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
self.navigationController.navigationBar.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.navigationController.navigationBar.bounds cornerRadius:self.navigationController.navigationBar.layer.cornerRadius].CGPath;
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

## Change status bar text color for iOS7

**On ViewController**
1. Set the `UIViewControllerBasedStatusBarAppearance` to `YES` in the plist.
2. Edit `ViewController.m`

```obj-c
- (void)viewDidLoad
{
    [super viewDidLoad];

    // ADD THIS LINE
    [self setNeedsStatusBarAppearanceUpdate];
}

// ADD THIS METHOD
- (UIStatusBarStyle)preferredStatusBarStyle { 
    return UIStatusBarStyleLightContent; 
}
```

**OR** Update the `UINavigationBar` color, then it will follow. Put the code below to `application:didFinishLaunchingWithOptions:`

```obj-c
// only for iOS7
if ([[UIDevice currentDevice].systemVersion floatValue] >= 7) {
    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
}
```

**On splash screen**

Edit `Info.plist`
```xml
<dict>
    ...
    <key>UIStatusBarStyle</key>
    <string>UIStatusBarStyleLightContent</string>
    ...
</dict>
```

References:

- [How to change Status Bar text color in iOS 7](http://stackoverflow.com/questions/17678881/how-to-change-status-bar-text-color-in-ios-7/17768797#17768797)
- [How to change status bar style during launch on iOS 7](http://stackoverflow.com/questions/18924345/how-to-change-status-bar-style-during-launch-on-ios-7/18924428#18924428)
- [How to set Status bar background color iOS 7 [duplicate]](http://stackoverflow.com/questions/19176784/how-to-set-status-bar-background-color-ios-7/19176975#19176975)

## UIView autoresizingMask to bottom left

If want to achive the result like this in programmatic way

![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/autoresizingmask-bottom-left.png "To bottom left")  

```obj-c
// flexible right & flexible top
view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
```

Reference: [UIView autoresizingMask problem](http://stackoverflow.com/questions/3069388/uiview-autoresizingmask-problem/3069427#3069427)

## Check location service enabled for this app

```obj-c
if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
    // location service is not allowed for this app
}
```

Reference: [How to check if location services are enabled for a particular app prior to iOS 4.2?](http://stackoverflow.com/questions/4700987/how-to-check-if-location-services-are-enabled-for-a-particular-app-prior-to-ios#comment-21140860)

## A trigger of after view added to subview

A `CustomView` want to execute some logic once added to other view

**ViewController.m**
```obj-c
CustomView *view = [[CustomView alloc] init];
[self.view addSubview:view];
```

**CustomView.m**
```obj-c
- (void)didMoveToSuperview
{
    NSLog(@"Just added to other view");
}
```

Reference: [iPhone/iOS: Will there be called any method if a UIView is added as a subview](http://stackoverflow.com/questions/6162211/iphone-ios-will-there-be-called-any-method-if-a-uiview-is-added-as-a-subview/6162228#6162228)

## Show static map (Google) on UIImageView
```obj-c
UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(position_x, position_y, width, height)];

double latitude = 3.4005, longitude = 101.34888;
int zoomLevel = 11;

NSString *staticMapUrlString = [NSString stringWithFormat:@"http://maps.google.com/maps/api/staticmap?markers=color%%3Ared%%7C%f,%f&zoom=%d&size=%dx%d&sensor=true", latitude, longitude, zoomLevel, (int)imageView.bounds.size.width, (int)imageView.bounds.size.height];
NSURL *staticMapUrl = [NSURL URLWithString:staticMapUrlString];

imageView.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:staticMapUrl]];
```

String encoding in URL

* `%%3A` - is refer to colon _(:)_, the **double percent** _(%%)_ is to escape the string parameters
* `%%7C` - is refer to the pipe line _(|)_

References:

* [Get part of the map view as an image in iOS](http://stackoverflow.com/questions/7175300/get-part-of-the-map-view-as-an-image-in-ios/7950179#7950179)
* [Percent-encoding](http://en.wikipedia.org/wiki/Percent-encoding)

## Detect `double tap` event on UIImageView
```obj-c
- (void)viewDidLoad
{
    ...
    ImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    imageView.userInteractionEnabled = YES; // must enable

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    [tap setDelaysTouchesBegan:YES];
    tap.numberOfTapsRequired = 2; // double tap
    tap.numberOfTouchesRequired = 1;
    [imageView addGestureRecognizer:tap];
}

- (void)imageTapped:(UITapGestureRecognizer *)sender
{
    NSLog(@"Double tapped");
}
```

Reference: [Detect Double tap in UIScrollView](http://stackoverflow.com/questions/3905125/detect-double-tap-in-uiscrollview/12172200#12172200)

## Show character by give ASCII code (int) or vice versa

**Integer to alphabet**
```obj-c
int asciiCode = 97;
NSString *alphabet = [NSString stringWithFormat:@"%c", asciiCode]; // a
```

**Alphabet to integer**
```obj-c
NSString *alphabet = @"a";
int asciiCode = [alphabet characterAtIndex:0]; // 97
```

Reference: [How to convert ASCII value to a character in Objective-C?](http://stackoverflow.com/questions/2832729/how-to-convert-ascii-value-to-a-character-in-objective-c/2832933#2832933)

## Change UITabBarController tint color

Change the bar color
```obj-c
tabBarController.tabBar.barTintColor = [UIColor blackColor];
```

Change the icon & text color
```obj-c
tabBarController.tabBar.tintColor = [UIColor whiteColor];
```

Change the text color only
```obj-c
// change the selected text color
[[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:10.0f],
                                                    NSForegroundColorAttributeName: [UIColor whiteColor]
                                                    } forState:UIControlStateSelected];


// change the unselected text color
[[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:10.0f],
                                                    NSForegroundColorAttributeName: [UIColor whiteColor]
                                                    } forState:UIControlStateNormal];
```

Reference: [How can I change the text and icon colors for tabBarItems in iOS 7?](http://stackoverflow.com/questions/18734794/how-can-i-change-the-text-and-icon-colors-for-tabbaritems-in-ios-7/18734795#18734795)

## Fix the status bar some time not showing text on iOS7
Edit **Project-Info.plist** file, add the content below
```xml
<key>UIViewControllerBasedStatusBarAppearance</key>
<false/>
```

Or open in **Property list**

![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/status-bar-appearance.png "Status bar appearance")  

## Extract submatch from string using regular expression
Example here shows extract date from NSDate object

The format we want is **YYYY-MM-DD**

```obj-c
NSLog(@"date %@", date);
// this will return (for example)
// 2014-01-27 10:17:00 +0000
```

So we can extract out the part using regex
```obj-c
NSDate *date = ...;

// extract 4 integers followed by a dash followed by 2 integers followed by a dash followed by 2 integers again
NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(\\d{4}-\\d{2}-\\d{2})"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:&error];
[regex enumerateMatchesInString:date.description options:0 range:NSMakeRange(0, date.description.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
    // just get the substring by the range
    NSString *dateStr = [sender.date.description substringWithRange:[result rangeAtIndex:0]];
    NSLog(@"Date only: %@", dateStr);
    // this will show
    // Date only: 2014-01-27
}];
```

**Update**
For this case, want to extract out the `minutes` & `seconds`
```obj-c
NSString *message = @"Your computer will be shutdown in 3 minutes 25 seconds";

// Only match for the minutes & seconds
NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(\\d+) minutes (\\d+) seconds"
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:&error];
[regex enumerateMatchesInString:date.description options:0 range:NSMakeRange(0, date.description.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {

    // `rangeAtIndex` 0 will be "3 minutes 25 seconds, so we don't take
    // `rangeAtIndex` 1 will be "3"
    // `rangeAtIndex` 2 will be "25"
    int minutes = [[message substringWithRange:[result rangeAtIndex:1]] intValue];
    int seconds = [[message substringWithRange:[result rangeAtIndex:2]] intValue];
    NSLog(@"%dm %ds", minutes, seconds); // 3m 25s
}];
```

It always matches the main match then only followed by submatch

Reference: [Extract parts from regular expression with NSRegularExpression](http://stackoverflow.com/questions/9601551/extract-parts-from-regular-expression-with-nsregularexpression/9656243#9656243)

## Resize UIImage
```obj-

+ (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size retainAspectRatio:(BOOL)aspectRatio
{
    CGSize newSize = size;
    if (aspectRatio) {
        // whether is based on width to calculate or height
        BOOL baseOnWidth = size.width > size.height ? YES : NO;
        
        if (baseOnWidth) {
            newSize.height = (size.width / image.size.width) * image.size.height;
        } else {
            newSize.width = (size.height / image.size.height) * image.size.width;
        }
    }
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
```

Reference: [The simplest way to resize an UIImage?](http://stackoverflow.com/questions/2658738/the-simplest-way-to-resize-an-uiimage/2658801#2658801)

## `UISegmentedControl` deselect segment

```obj-c
[segmentedControl setSelectedSegmentIndex:UISegmentedControlNoSegment];
```

Reference: [UISegmentedControl deselect (make none of the segments selected)](http://stackoverflow.com/questions/2206066/uisegmentedcontrol-deselect-make-none-of-the-segments-selected/9164981#9164981)

## `UISegmentedControl` change text & border color

Border color
```obj-c
segmentedControl.tintColor =[UIColor colorWithRed:50/255.0f green:150/255.0f blue:100/255.0f alpha:1];
```

Text color
```obj-c
[segmentedControl setTitleTextAttributes:@{UITextAttributeTextColor: [UIColor blueColor]} forState:UIControlStateSelected];
```

## Add `UISegmentedControl` to `UIToolbar`
```obj-c
UISegmentedControl *nextPrevSegment = [[UISegmentedControl alloc] initWithItems:@[@"Previous", @"Next"]];
nextPrevSegment.segmentedControlStyle = UISegmentedControlStyleBar;
[nextPrevSegment addTarget:self action:@selector(nextPrevTouched:) forControlEvents:UIControlEventValueChanged];
UIBarButtonItem *segmentedControlButtonItem = [[UIBarButtonItem alloc] initWithCustomView:(UIView *)nextPrevSegment];
UIToolbar *keyboardToolbar = [[UIToolbar alloc] init];
[keyboardToolbar setTintColor:[UIColor whiteColor]];
[keyboardToolbar sizeToFit];
[keyboardToolbar setItems:[NSArray arrayWithObjects:segmentedControlButtonItem, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], nil]];
```

## Use custom font in `UIWebView`

```obj-c
NSString *html = @"<p>This is a paragraph<\/p>";
NSString *htmlString = 
    [NSString stringWithFormat:@"<font face='GothamRounded-Bold' size='2'>%@", html];
[webView loadHTMLString:htmlString baseURL:nil];
```

Reference: [How to change UIWebView default font](http://stackoverflow.com/questions/12533445/how-to-change-uiwebview-default-font/15940938#15940938)

## Set delay to perform action
```obj-c
double delayInSeconds = 2.0;
dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    //code to be executed on the main queue after delay
    NSLog(@"Action here delayed 2 seconds.");
});
```

Reference: [how to call a method with delay](http://stackoverflow.com/questions/9634790/how-to-call-a-method-with-delay/9634819#9634819)

## Remove section border for iOS6
```obj-c
cell.backgroundView = [UIView new];
```

Reference: [Removing cell borders from a section of grouped-style UITableView](http://stackoverflow.com/questions/4202965/removing-cell-borders-from-a-section-of-grouped-style-uitableview/6808255#6808255)

## UITableView grouped style change background color for iOS6
transparent background
```obj-c
tableView.backgroundView = [UIView new];
```

for color background
```obj-c
UIView* bview = [[UIView alloc] init];
bview.backgroundColor = [UIColor yellowColor];
[tableView setBackgroundView:bview];
```

Reference: [Set background color on UITableView in IOS 6 [duplicate]](http://stackoverflow.com/questions/12617913/set-background-color-on-uitableview-in-ios-6/12617972#12617972)

## Make the UINavigationBar transparent
```obj-c
self.navigationController.navigationBar.shadowImage = [UIImage new];
// remove the inner shadow

// for iOS 7, remove the background image
if ([[UIDevice currentDevice].systemVersion floatValue] >= 7) {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
} else { // for iOS 6, set the image filled with color that same as the view's background color
    // see https://github.com/jslim89/js-learning-journey/tree/master/programming/objective-c#create-rectangle-uiimage-programmatically
    [self.navigationController.navigationBar setBackgroundImage:[MyClass imageWithColor:[UIColor yellowColor] inSize:CGSizeMake(320, 44) withCornerRadius:0] forBarMetrics:UIBarMetricsDefault];
}
```

Reference: [How to remove UINavigationBar inner shadow in iOS 7?](http://stackoverflow.com/questions/18160173/how-to-remove-uinavigationbar-inner-shadow-in-ios-7/19279550#19279550)

## Set 2 different colors in a view
This can be achieved by using `CALayer`
```obj-c
CALayer *sublayer = [CALayer layer];
sublayer.backgroundColor = [UIColor yellowColor].CGColor;
sublayer.frame = CGRectMake(0, 300, self.view.frame.size.width, 100);
[self.view.layer addSublayer:sublayer];
```

This will set the color of view to yellow color in (0, 300, 320, 100)

## `UITableView` delegate after `reloadData` is called
```obj-c
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        NSLog(@"Finished loaded");
    }
}
```

Reference: [How to detect the end of loading of UITableView](http://stackoverflow.com/questions/4163579/how-to-detect-the-end-of-loading-of-uitableview/11672379#11672379)

## Bold certain text on `UILabel`

```obj-c
// normal font
NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                       [UIFont fontWithName:@"Helvetica" size:20], NSFontAttributeName,
                       [UIColor whiteColor], NSForegroundColorAttributeName,
                       nil];
// bold font
NSDictionary *boldAttrs = [NSDictionary dictionaryWithObjectsAndKeys:
                          [UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil];

NSString *text = @"The quick brown fox jumps over the lazy dog";

NSRange range = NSMakeRange(4, 15); // bold the text "quick brown fox"
// init with regular attributes
NSMutableAttributedString *textAttr = [[NSMutableAttributedString alloc] initWithString:text attributes:attrs];
[textAttr setAttributes:boldAttrs range:range]; // set specific attributes for range of text
[myLabel setAttributedText:textAttr];
```

**NOTE: This is for iOS6 and above only**

Reference: [Bold & Non-Bold Text In A Single UILabel?](http://stackoverflow.com/questions/3586871/bold-non-bold-text-in-a-single-uilabel/3586943#3586943)

## Create class dynamically from string
```obj-c
NSString* className = @"MyClass";
[[NSClassFromString(className) alloc] init...];
```

Reference: [Create object from NSString of class name in Objective-C](http://stackoverflow.com/questions/2951828/create-object-from-nsstring-of-class-name-in-objective-c/2951835#2951835)

## Check is `nib` exists
```obj-c
if([[NSBundle mainBundle] pathForResource:fileName ofType:@"nib"] != nil) {
    // nib exists
}
```

Reference: [Checking if a .nib or .xib file exists](http://stackoverflow.com/questions/923706/checking-if-a-nib-or-xib-file-exists/932023#932023)

## Default share on iOS 6 and above
```obj-c
- (void)shareText:(NSString *)string andImage:(UIImage *)image
{
    NSMutableArray *sharingItems = [NSMutableArray new];

    if (string) {
        [sharingItems addObject:string];
    }
    if (image) {
        [sharingItems addObject:image];
    }

    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}
```

Reference: [How to display the default iOS 6 share action sheet with available share options?](http://stackoverflow.com/questions/13498459/how-to-display-the-default-ios-6-share-action-sheet-with-available-share-options/13499204#13499204)

## Sort CoreData children objects

In **MyParent.h**
```obj-c
...
@property (nonatomic, retain) NSSet *children;

// add this
- (NSArray *)sortedChildren;
```

In **MyParent.m**
```obj-c
...
- (NSArray *)sortedChildren
{
    NSSortDescriptor *timestamp = [NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:YES];
    return [[self.conversations allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:timestamp]];
}
```

Then you can now invoked by `[myparent sortedChildren]`

Reference: [Core data, sorting one-to-many child objects](http://stackoverflow.com/questions/2524284/core-data-sorting-one-to-many-child-objects/2530879#2530879)

## Long press event on table row
```obj-c
- (void)viewDidLoad
{
    ...
    // add to the tableView instead of tableViewCell
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewPressed:)];
    [self.tableView addGestureRecognizer:longPress];
}

- (void)tableViewPressed:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) { // only take action in this state
        CGPoint point = [sender locationInView:self.tableView]; // get the point (x, y)
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point]; // look for correct indexPath
        // in case you have section header
        CGFloat headerHeight = [self tableView:self.tableView heightForHeaderInSection:indexPath.section];
        
        // first row should be at the offset y which between (height of header view) and rowHeight + header for header view
        if ((point.y < headerHeight || point.y > (self.tableView.rowHeight + headerHeight)) && indexPath.row == 0) return;

        // do action here
    }
}
```

## Clear CoreData tables
**AppDelegate.m**
```obj-c
- (void)flushDatabase
{
    [__managedObjectContext lock];
    NSArray *stores = [__persistentStoreCoordinator persistentStores];
    for(NSPersistentStore *store in stores) {
       [__persistentStoreCoordinator removePersistentStore:store error:nil];
       [[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:nil];
    }
    [__managedObjectContext unlock];
    __managedObjectModel    = nil;
    __managedObjectContext  = nil;
    __persistentStoreCoordinator = nil;
}
```

Reference: [Clearing CoreData and all that inside](http://stackoverflow.com/questions/14727583/clearing-coredata-and-all-that-inside/14886421#14886421)

## Compare `CGAffineTransform`
```obj-c
if (CGAffineTransformEqualToTransform(transform, CGAffineTransformIdentity)) {
    // is equal
}
```

Reference: [How to Compare CGAffinetransform?](http://stackoverflow.com/questions/19583119/how-to-compare-cgaffinetransform/19583332#19583332)

## `UILabel` justify text to fit left & right
```obj-c
NSMutableParagraphStyle *paragraphStyles = [[NSMutableParagraphStyle alloc] init];
paragraphStyles.alignment = NSTextAlignmentJustified;
paragraphStyles.firstLineHeadIndent = 0.05;    // Very IMP

NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                       paragraphStyles, NSParagraphStyleAttributeName,
                       nil];

NSString *content = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
// Create the attributed string (text + attributes)
NSMutableAttributedString *textAttrs = [[NSMutableAttributedString alloc] initWithString:content attributes:attrs];

UILabel *justifiedLabel = [[UILabel alloc] initWithFrame:...];
justifiedLabel.numberOfLines = 0;
justifiedLabel.lineBreakMode = NSLineBreakByWordWrapping;
[justifiedLabel setAttributedText:textAttrs];
[justifiedLabel sizeToFit];
...
```

Reference: [NSTextAlignmentJustified to UILable textAligment on iOS6 will crash](http://stackoverflow.com/questions/13947650/nstextalignmentjustified-to-uilable-textaligment-on-ios6-will-crash/14919060#14919060)

## `application:didReceiveRemoteNotification:` not called on app launching
During the first launch, this method will not be called, thus have to handle this manually
```obj-c
NSDictionary *remoteNotification = [launchOptions objectForKey: UIApplicationLaunchOptionsRemoteNotificationKey];
if (remoteNotification) {
    // call the method manually
    [self application:application didReceiveRemoteNotification:remoteNotification];
}
```

Reference: [Calling didReceiveRemoteNotification when app is launching for the first time](http://stackoverflow.com/questions/14968578/calling-didreceiveremotenotification-when-app-is-launching-for-the-first-time/14968832#14968832)

## Remove notification from banner
Both lines are required
```obj-c
[[UIApplication sharedApplication] setApplicationIconBadgeNumber: 0];
[[UIApplication sharedApplication] cancelAllLocalNotifications];
```

Reference: [iOS application: how to clear notifications?](http://stackoverflow.com/questions/8682051/ios-application-how-to-clear-notifications/8682811#8682811)

## Get version number
```obj-c
NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
NSString *build = [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
```

Reference: [How do I get the current version of my ios project in code?](http://stackoverflow.com/questions/7608632/how-do-i-get-the-current-version-of-my-ios-project-in-code/7608711#7608711)

## `UISearchBar` flat color
```obj-c
// only apply for iOS 6
if ([[UIDevice currentDevice].systemVersion floatValue] < 7) {
    // go through the subview
    for (UIView *subview in self.searchBar.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            // add a view filled with flat color to the background view
            UIView *flatView = [[UIView alloc] initWithFrame:subview.bounds];
            flatView.backgroundColor = [UIColor greenColor];
            [subview addSubview:flatView];
            break;
        }
    }
}
```

Reference: [How to apply a solid color to a UISearchBar](http://stackoverflow.com/questions/3496829/how-to-apply-a-solid-color-to-a-uisearchbar/12906714#12906714)

## Add tap event to `UINavigationBar` title
```obj-c
UITapGestureRecognizer *titleViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleViewTapped:)];
UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
// adjust to center
titleLabel.textAlignment = NSTextAlignmentCenter;
// standardize the text color, font
titleLabel.textColor = [[UINavigationBar appearance].titleTextAttributes valueForKey:UITextAttributeTextColor];
titleLabel.font = [[UINavigationBar appearance].titleTextAttributes valueForKey:UITextAttributeFont];
titleLabel.userInteractionEnabled = YES;
titleLabel.text = @"My awesome title";
[titleLabel addGestureRecognizer:titleViewTap];
self.navigationItem.titleView = titleLabel;
```

Then add a method
```obj-c
- (void)titleViewTapped:(UITapGestureRecognizer *)sender
{
    NSLog(@"user tapped");
}
```

Reference: [UINavigationBar Touch](http://stackoverflow.com/questions/2077025/uinavigationbar-touch)

## UITableView separator on iOS7 show full width

```obj-c
if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
    [tableView setSeparatorInset:UIEdgeInsetsZero];
}
```

Reference: [How to fix UITableView separator on iOS 7? [duplicate]](http://stackoverflow.com/questions/18773239/how-to-fix-uitableview-separator-on-ios-7/18773281#18773281)

## Change UIImage default image color

![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/white-icon.png "Original icon color")  
![alt text] (https://raw.github.com/jslim89/js-learning-journey/master/programming/objective-c/images/gray-icon.png "New color")  

```obj-c
UIImage *whiteIcon = [[UIImage imageNamed:@"WhiteIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

UIImageView *iconImageView = [[UIImageView alloc] initWithImage:whiteIcon];
iconImageView.tintColor = [UIColor grayColor];
```

Reference: [How can I change every color in a UIImage to gray? [closed]](http://stackoverflow.com/questions/19970309/how-can-i-change-every-color-in-a-uiimage-to-gray/19973019#19973019)

## Detect a shake event
Add the code below to your ViewController

```obj-c
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake )
    {
        NSLog(@"Shake begin");
    }
}


-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake )
    {
        NSLog(@"Shake ended");
    }
}
```

Reference: [Objective C: Detecting a shake](http://stackoverflow.com/questions/4807551/objective-c-detecting-a-shake/4808879#4808879)

## Remove 1px gradient on top of `UITabBar`

```obj-c
[[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
```

Reference: [iOS UITabBar : Remove top shadow gradient line](http://stackoverflow.com/questions/14371343/ios-uitabbar-remove-top-shadow-gradient-line/16334578#16334578)

## Vibrate device
Import this `AudioToolbox.framework` from **Link Binary With Library**
```obj-c
#import <AudioToolbox/AudioServices.h>
```
Then, use either 1 of the following
```obj-c
AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
```

Reference: [Making the iPhone vibrate](http://stackoverflow.com/questions/4724980/making-the-iphone-vibrate/4725039#4725039)

## Get reference counter in ARC mode

```obj-c
NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)myObject));
```

Reference: [How do I verify reference count in ARC mode?](http://stackoverflow.com/questions/8863269/how-do-i-verify-reference-count-in-arc-mode/8963645#8963645)

## Hide the `UINavigationBar` back button

```obj-c
[self.navigationItem setHidesBackButton:YES animated:YES];
```

Reference: [How to hide the “back” button in UINavigationController?](http://stackoverflow.com/questions/1453519/how-to-hide-the-back-button-in-uinavigationcontroller/1453702#1453702)

## Change `UIAlertView` keyboard type to numpad

```obj-c
alert.alertViewStyle = UIAlertViewStylePlainTextInput;
[[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
[alert show];
```

**The sequence is important**

Reference: [UIAlertView: UIAlertViewStyleSecureTextInput: Numeric keyboard](http://stackoverflow.com/questions/10579658/uialertview-uialertviewstylesecuretextinput-numeric-keyboard/10579935#10579935)

## Bad performance after adding shadow

When adding shadow effect to tableView/collectionView cell, the performance will drop significantly. 

```obj-c
view.layer.shouldRasterize = YES;
```

Set the property above solve the issue

Reference: [I Have bad performance on using shadow effect](http://stackoverflow.com/questions/6395139/i-have-bad-performance-on-using-shadow-effect/6396932#6396932)

## `UICollectionViewCell` subclass init never run

Implement in `initWithFrame:` instead

Reference: [UICollectionViewCell subclass init never run](http://stackoverflow.com/questions/16531867/uicollectionviewcell-subclass-init-never-run/16531906#16531906)

## Take screenshot from UIView

```obj-c
- (UIImage *)screenshotImageFromView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, 1, 0.0f);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return image;
}

// usage
UIImage *img = [self screenshotImageFromView:self.view];
```

## `UIColor` from hex string

Add a macro in `<Project>-Prefix.pch`

```obj-c
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
```

Then add a helper function

```obj-c
- (unsigned int)intFromHexString:(NSString *) hexStr
{
    unsigned int hexInt = 0;

    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];

    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];

    // Scan hex value
    [scanner scanHexInt:&hexInt];

    return hexInt;
}
```

Usage

```obj-c
UIColor *color = UIColorFromRGB([self intFromHexString:@"#ff3366"]);
```

References:

- [Objective C UIColor from RGB](http://www.albertopasca.it/whiletrue/2010/08/objective-c-uicolor-set-color-from-rgb/)
- [Convert Hex Value Stored As NSString To Integer](http://iosdevelopertips.com/conversion/convert-hex-value-stored-as-string-to-integer.html)

## LocationService not working on iOS8

```obj-c
if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
    [_locationManager requestWhenInUseAuthorization];
}
```

Call this method before `startUpdatingLocation`.

In the **Info.plist**, add

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>You are required to enable the location service to get accurate results.</string>
```

Reference: [iOS 8 : Location Services not working](https://stackoverflow.com/questions/24062509/ios-8-location-services-not-working/24063578#24063578)

## `CLPlacemark.administrativeArea` Malaysia list

```
Selangor
Negri Sembilan
KL
Kedah
Pinang
Perak
Perlis
Malacca
Johore
Pahang
Terengganu
Kelantan
Sabah
Sarawak
Wilayah Persekutuan Labuan
```

## Change `UITextField` placeholder color

```obj-c
if ([textField respondsToSelector:@selector(setAttributedPlaceholder:)]) {
    UIColor *color = [UIColor colorWithWhite:1 alpha:0.7];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Placeholder text" attributes:@{NSForegroundColorAttributeName: color}];
} else {
    TSLog(@"Cannot set placeholder text's color, because deployment target is earlier than iOS 6.0");
}
```

Reference: [iPhone UITextField - Change placeholder text color](http://stackoverflow.com/questions/1340224/iphone-uitextfield-change-placeholder-text-color/13695462#13695462)

## Underline text on `UIButton`

```obj-c
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
button.titleLabel.textColor = [UIColor whiteColor];
button.backgroundColor = [UIColor clearColor];
NSMutableAttributedString *buttonStr = [[NSMutableAttributedString alloc] initWithString:@"or do other stuff"];
[buttonStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(3, [buttonStr length] - 3)];
[button setAttributedTitle:buttonStr forState:UIControlStateNormal];
```

The code above will underline **do other stuff**.

Reference: [UIButton Or UILabel with underlined text. iOS 6 or iOS 7](http://iostechsolutions.blogspot.com/2014/04/uibutton-or-uilabel-with-underlined.html)

## Loop through `NSDate`

```obj-c
- (void)dateRangeFrom:(NSDate *)fromDate to:(NSDate *)toDate
{
    // add 1 day to them, e.g.
    // fromDate = 2014-11-05 ; toDate = 2014-10-30, without adding 1 day, it will loop from 2014-11-04 to 2014-10-29
    fromDate = [fromDate dateByAddingTimeInterval:24 * 60 * 60];
    toDate = [toDate dateByAddingTimeInterval:24 * 60 * 60];

    NSDateComponents *component = [NSDateComponents new];
    
    // if fromDate is greater than toDate, then loop decending, ascending otherwise
    NSComparisonResult compareResult;
    if ([fromDate compare:toDate] == NSOrderedAscending) {
        compareResult = NSOrderedAscending;
        component.day = 1; // loop through day by day
    } else {
        compareResult = NSOrderedDescending;
        component.day = -1;
    }
    
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    
    while ([fromDate compare:toDate] == compareResult) {
        fromDate = [currentCalendar dateByAddingComponents:component toDate:fromDate options:0];
        NSLog(@"Date %@", fromDate);
    }
}
```

Reference: [Loop between two NSDates in Objective C [closed]](http://stackoverflow.com/questions/18289923/loop-between-two-nsdates-in-objective-c/18290759#18290759)

## Add touch event on `UIStatusBar`

**AppDelegate.h**
```obj-c
static NSString * const kStatusBarTappedNotification = @"statusBarTappedNotification";
```

**AppDelegate.m**
```obj-c
#pragma mark - Status bar touch tracking
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    CGPoint location = [[[event allTouches] anyObject] locationInView:[self window]];
    CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
    if (CGRectContainsPoint(statusBarFrame, location)) {
        [self statusBarTouchedAction];
    }
}

- (void)statusBarTouchedAction {
    [[NSNotificationCenter defaultCenter] postNotificationName:kStatusBarTappedNotification
                                                        object:nil];
}
```

**AnyViewController.m**
```obj-c
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarTappedAction:) name:kStatusBarTappedNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kStatusBarTappedNotification object:nil];
}

- (void)statusBarTappedAction:(NSNotification*)notification
{
    NSLog(@"StatusBar tapped");
}
```

Reference: [How to detect touches in status bar](https://stackoverflow.com/questions/3753097/how-to-detect-touches-in-status-bar/18953439#18953439)
