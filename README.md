## Features

Flutter屏幕适配方案 / Flutter screen adaptation solution

## Screenshot

| <img src="https://github.com/hwh97/screenshot_res/blob/master/flutter_screen_adapter/s1.png" width="340px" alt="screenshot"> | <img src="https://github.com/hwh97/screenshot_res/blob/master/flutter_screen_adapter/s1_landscape.png" width="340px" alt="screenshot"> |
|:----------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------:|
| <img src="https://github.com/hwh97/screenshot_res/blob/master/flutter_screen_adapter/s2.png" width="340px" alt="screenshot"> | <img src="https://github.com/hwh97/screenshot_res/blob/master/flutter_screen_adapter/s2_landscape.png" width="340px" alt="screenshot"> |

## Usage

### Step1:
Import package
```
flutter_screen_adapter:
    git:
    url: git@github.com:hwh97/flutter_screen_adapter.git 
```
### Step2:
Add builder to MaterialApp
```
MaterialApp(
    builder: (context, child) => screenAdapterBuilder(
        child: child,
        designSize: const Size(375, 812),
        tabletDesignSize: const Size(768, 1024),
    ),
)
```

## Note
This plugin uses width >= 550 to get tablet or not. Feel free to pr if you have a better way.

## Thanks
https://juejin.cn/post/6844903822188363789

https://pub.flutter-io.cn/packages/responsive_framework