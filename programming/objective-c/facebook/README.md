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
