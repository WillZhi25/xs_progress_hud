import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:xs_progress_hud/xs_progress_hud.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = '1.0';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: new AppBar(
            title: new Text('XS Progress HUD Demo'),
          ),
          body: Container(
            height: 500.0,
            child: new Stack(
              children: <Widget>[
                Positioned(
                    child: new FlatButton(
                        onPressed: showHud, child: new Text("Show hud")),
                    top: 30.0,
                    left: 10.0),
                Positioned(
                    child: new FlatButton(
                        onPressed: showMessageHud,
                        child: new Text("Show message hud")),
                    top: 130.0,
                    left: 10.0),
                Positioned(
                    child: new FlatButton(
                        onPressed: showCustomHud,
                        child: new Text("Show custom hud")),
                    top: 230.0,
                    left: 10.0)
              ],
            ),
          )),
    );
  }

  Future<void> showHud() async {
    XsProgressHud.show(context);
    Future.delayed(Duration(milliseconds: 2000)).then((val) {
      XsProgressHud.hide();
    });
  }

  Future<void> showMessageHud() async {
    XsProgressHud.showMessage(context, "Flutter app");
  }

  Future<void> showCustomHud() async {
    XsProgressHud hud = XsProgressHud();
    // you can change some property， like  hud.progressColor = Colors.red;
    hud.progressColor = Colors.red;
    Navigator.push(context, hud);
    Future.delayed(hud.delayed).then((val) {
      hud.navigator.pop();
    });
  }
}
