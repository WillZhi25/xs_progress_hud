# xs_progress_hud

# showcase

## normal hud
```dart
Future<void> showHud() async {
    XsProgressHud.show(context);
    Future.delayed(Duration(milliseconds: 2000)).then((val) {
      XsProgressHud.hide();
    });
  }
```
![](https://github.com/zhiwupei/xs_progress_hud/blob/master/image/image1.gif?raw=true)
## message hud

```dart
  Future<void> showMessageHud() async {
    XsProgressHud.showMessage(context, "Flutter app");
  }
```
![](https://github.com/zhiwupei/xs_progress_hud/blob/master/image/image2.gif?raw=true)
## custom hud

```dart
  Future<void> showCustomHud() async {
    XsProgressHud hud = XsProgressHud();
    // you can change some property， like  hud.progressColor = Colors.red;
    hud.progressColor = Colors.red;
    Navigator.push(context, hud);
    Future.delayed(hud.delayed).then((val) {
      hud.navigator.pop();
    });
  }
```
![](https://github.com/zhiwupei/xs_progress_hud/blob/master/image/image3.gif?raw=true)
