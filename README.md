## Features

低侵入性的flutter屏幕适配方案 / Low-invasive flutter screen adaptation solution

## Screenshot

| <img src="https://github.com/hwh97/screenshot_res/blob/master/flutter_screen_adapter/s1.jpeg" width="340px" alt="screenshot"> | <img src="https://github.com/hwh97/screenshot_res/blob/master/flutter_screen_adapter/s2.jpeg" width="340px" alt="screenshot"> |
|:-----------------------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------:|

## Usage

### Step1:
Initial design width, default is 375
```
ScreenUtil.init(designWidth: 375);
```
### Step2:
Replace runAdapterApp with runApp
```
runAdapterApp(const MyApp());
```
### Step3:
Add builder to MaterialApp
```
MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
    builder: mediaQueryBuilder,
    home: const MyHomePage(title: 'Flutter Demo Home Page'),
)
```

## Thanks
https://juejin.cn/post/6844903822188363789