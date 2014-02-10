# Lessons

## Resize image proportionally by height

Example shows resize the image to **any width** but exactly **100px height**

```php
$img = WideImage::load('/path/to/image.jpg');
$img->resize($img->getWidth(), 100)->saveToFile('/destination/image.jpg');
```

Set the **width** to original image size will achieve this.
