# Lessons

Language: Node JS

## Every time launch auto reset the app data

Set the `capability` attribute _noReset_ to `true`. Otherwise the whatsapp
will required to key in SMS code every time you launch it.

```js
exports.android25 = { 
  browserName: '', 
  'appium-version': '1.6',
  platformName: 'Android',
  platformVersion: '7.1',
  noReset: true, <-------- ADD THIS
  deviceName: '192.168.57.101:5555',
  appPackage: 'com.whatsapp',
  appActivity: 'com.whatsapp.HomeActivity'
};
```

Reference: [First Appium Test Script to Launch App on Real Device](http://www.automationtestinghub.com/first-appium-test-script/#comment-3296139445)
