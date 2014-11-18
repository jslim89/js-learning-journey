# Lesson

## Check is offline
```obj-c
[[AFNetworkReachabilityManager sharedManager] startMonitoring];
[[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
    NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    switch (status) {
        case AFNetworkReachabilityStatusReachableViaWWAN:
        case AFNetworkReachabilityStatusReachableViaWiFi:
            NSLog(@"online");
            break;
        case AFNetworkReachabilityStatusNotReachable:
        default:
            NSLog(@"offline");
            break;
    }
}];
```

Reference: [AFNetworking 2.0 queue request when device is offline with setReachabilityStatusChangeBlock does nothing](http://stackoverflow.com/questions/21938680/afnetworking-2-0-queue-request-when-device-is-offline-with-setreachabilitystatus/22112135#22112135)
