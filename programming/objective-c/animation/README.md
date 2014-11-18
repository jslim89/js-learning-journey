# Lessons

## Flip animation between view controllers
Present
```obj-c
viewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
[self presentViewController:viewController animated:YES completion:nil];
```

Dismiss
```obj-c
[self dismissViewControllerAnimated:YES completion:nil];
```

Reference: [How to do the flip animation between two UIViewControllers while clicking info button?](http://stackoverflow.com/questions/4622996/how-to-do-the-flip-animation-between-two-uiviewcontrollers-while-clicking-info-b/7384986#7384986)

## Move object from bottom to top

```obj-c
// set the initial position
UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 320, 240, 100)];
...

[UIView animateWithDuration:1.0 // 1 second
                      delay:0.0
                    options:UIViewAnimationOptionCurveLinear
                 animations:^{
                     // move the image to top
                     imageView.center = CGPointMake(imageView.center.x, 100);
                 }
                 completion:nil];
```

## Fade in UIButton

```obj-c
UIButton *fooButton = [UIButton buttonWithType:UIButtonTypeCustom];
fooButton.frame = ...;
fooButton.alpha = 0; // set to transparent first

[UIView animateWithDuration:0.5 // 0.5 second
                      delay:0.0
                    options:UIViewAnimationOptionCurveLinear
                 animations:^{
                     fooButton.alpha = 1.0; // slowly fade in
                 }
                 completion:nil];
```

Reference: [Fading in and out UIButton in view](http://stackoverflow.com/questions/8047536/fading-in-and-out-uibutton-in-view/8047622#8047622)

## Flip animation between 2 views
```obj-c
[UIView beginAnimations:nil context:NULL];
[UIView setAnimationDuration:1.0];
[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:NO];

// optional: event handler after animation
[UIView setAnimationDelegate:self];
[UIView setAnimationDidStopSelector:@selector(viewFlipped)];

int listViewIndex = [self.view.subviews indexOfObject:self.tableView];
int mapViewIndex = [self.view.subviews indexOfObject:self.mapView];

if (listViewIndex > mapViewIndex)
{
    sender.title = @"List";
    [self.view bringSubviewToFront:self.mapView];
}
else
{
    sender.title = @"Map";
    [self.view bringSubviewToFront:self.tableView];
}

[UIView commitAnimations];
```

If you added the event handler, just add the code below
```obj-c
- (void)viewFlipped
{
    NSLog(@"Flip animation completed.");
}
```

References:

- [iPhone subview flip between 2 views](http://stackoverflow.com/questions/2336998/iphone-subview-flip-between-2-views/2337273#2337273)
- [iPhone: How to commit two animations after another](http://stackoverflow.com/questions/5486164/iphone-how-to-commit-two-animations-after-another/5486230#5486230)
