# Lessons

## Change `Label` font size

```cpp
auto label = Label::createWithTTF("Your text", "helvetica.ttf", 28);

// later on
auto ttfConfig = label->getTTFConfig();
ttfConfig.fontSize = 40; // change to 40 point
label->setTTFConfig(ttfConfig);
```
