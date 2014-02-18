# Lessons

## Resize image proportionally by height

Example shows resize the image to **any width** but exactly **100px height**

```php
$img = WideImage::load('/path/to/image.jpg');
$img->resize($img->getWidth(), 100)->saveToFile('/destination/image.jpg');
```

Set the **width** to original image size will achieve this.

## Create empty image from text

```php
// create emptye image with 100x100 size
$wideImage = \WideImage_TrueColorImage::create(100, 100);
// set the background transparent
$wideImage->fill(0,0, $wideImage->getTransparentColor());
// get the canvas and write text on it
$canvas = $wideImage->getCanvas();
// set the font with size 30 and font color to white
$canvas->useFont('/path/to/fonts/Helvetica-Bold.otf', 30, $wideImage->allocateColor(255, 255, 255));
// write text to canvas
$canvas->writeText('center', 'center', $display_title);
// save to file
$wideImage->saveToFile('output.png');
```

Reference: [WideImage - Transparent areas of converted PNG should be white](http://stackoverflow.com/questions/11965709/wideimage-transparent-areas-of-converted-png-should-be-white/13427679#13427679)
