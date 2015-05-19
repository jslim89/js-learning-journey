# Lesson

Force user to allow `publish_actions` permission
```obj-c
@implementation MyViewController {
    NSString *fbToken;
}

...

// when tapped on facebook button
- (IBAction)facebookTouched:(UIButton *)sender
{
    // We will request the user's public profile and the user's birthday
    // These are the permissions we need:
    NSArray *permissionsNeeded = @[@"publish_actions", @"email"];
    
    // don't cache the token
    FBSession *mySession = [[FBSession alloc] initWithAppID:nil permissions:permissionsNeeded urlSchemeSuffix:nil tokenCacheStrategy:[FBSessionTokenCachingStrategy nullCacheInstance]];
    
    [mySession openWithCompletionHandler:^(FBSession *session,
                                                     FBSessionState status,
                                                     NSError *error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook Error" message:@"You must allow Facebook permissions" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

        if (error) { // user not allow "email"
            [alert show];
        } else {
            
            // i don't know what is this for, if without this line, this block will be executed 2 times and get error
            if (status == 258) return;
            
            [FBSession setActiveSession:session];
            
            // Request the permissions the user currently has
            [FBRequestConnection startWithGraphPath:@"/me/permissions"
                                  completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                      if (!error) {
                                          // These are the current permissions the user has:
                                          NSDictionary *currentPermissions = [(NSArray *)[result data] objectAtIndex:0];
                                          
                                          // We will store here the missing permissions that we will have to request
                                          NSMutableArray *requestPermissions = [[NSMutableArray alloc] initWithArray:@[]];
                                          
                                          // Check if all the permissions we need are present in the user's current permissions
                                          // If they are not present add them to the permissions to be requested
                                          for (NSString *permission in permissionsNeeded){
                                              if (![currentPermissions objectForKey:permission]){
                                                  [requestPermissions addObject:permission];
                                              }
                                          }
                                          
                                          // If we have more permissions to request
                                          if ([requestPermissions count] > 0) { // user haven't allow publish_actions
                                              [alert show];
                                          } else {
                                              fbToken = session.accessTokenData.accessToken;
                                          }
                                          
                                      } else {
                                          // An error occurred, we need to handle the error
                                          // See: https://developers.facebook.com/docs/ios/errors
                                          NSLog(@"error %@", error.description);
                                      }
                                  }];
        }
    }];
}
```

## Get profile picture
```obj-c
// set image & user name
[FBSession setActiveSession:self.session];
[[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *FBuser, NSError *error) {
    if (error) {
        NSLog(@"error %@", error.description);
    } else {
        self.usernameLabel.text = [FBuser name];
        [self.avatarImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?height=100&type=normal&width=100", [FBuser username]]]];
    }
}];
```

Reference: [Getting username and profile picture from Facebook iOS 7](http://stackoverflow.com/questions/20623728/getting-username-and-profile-picture-from-facebook-ios-7/20623845#20623845)

# FacebookSDK 4.x

## Login

**ViewController.m**

```obj-c
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

- (void)facebookButtonTapped:(id)sender
{
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Facebook error: %@", [error localizedDescription]);
            return;
        }
        NSLog(@"Facebook token: %@", result.token.tokenString);
    }];
}
```

**AppDelegate.m**

```obj-c
#import <FBSDKCoreKit/FBSDKCoreKit.h>

...
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBSDKAppEvents activateApp];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}
```
