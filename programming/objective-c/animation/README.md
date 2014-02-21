# Lessons

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
