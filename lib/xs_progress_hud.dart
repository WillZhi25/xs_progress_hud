import 'dart:async';
import 'package:flutter/material.dart';

class XsProgressHud extends PopupRoute {
  /*
  * Show message.
  * */
  static Future<void> showMessage(BuildContext context, String message) async {
    try {
      if (_currentHud != null) {
        _currentHud.navigator.pop();
      }
      XsProgressHud hud = XsProgressHud();
      hud.message = message;
      _currentHud = hud;
      Navigator.push(context, hud);
      Future.delayed(hud.delayed).then((val) {
        _currentHud.navigator.pop();
        _currentHud = null;
      });
    } catch (e) {
      _currentHud = null;
    }
  }

  /*
  * show an hud.
  * when you want to do anything, you can call this show.
  * for example： begin network request
  * */
  static Future<void> show(BuildContext context) async {
    try {
      if (_currentHud != null) {
        _currentHud.navigator.pop();
      }
      XsProgressHud hud = XsProgressHud();
      _currentHud = hud;
      Navigator.push(context, hud);
    } catch (e) {
      _currentHud = null;
    }
  }

  /*
  * hide hud
  * when you complete something,you can call this hide to hide hud.
  * */
  static Future<void> hide() async {
    try {
      _currentHud.navigator.pop();
      _currentHud = null;
    } catch (e) {
      _currentHud = null;
    }
  }

// hud show this message, default null. when you set ,it will show message hud, not progress hud.
  String message;
  Color progressColor = Colors.grey;
  Color progressBackgroundColor = Colors.white;
  Color coverColor = Color.fromRGBO(0, 0, 0, 0.4);
  Duration delayed = Duration(milliseconds: 2000);
  TextStyle loadingTextStyle = TextStyle(
      fontSize: 13.0,
      color: Colors.black87,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none);
  TextStyle messageTextStyle = TextStyle(
      fontSize: 14.0,
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none);

  String loadingMessage = 'loading ...';

  static XsProgressHud _currentHud;

  @override
  // TODO: implement barrierColor
  Color get barrierColor => null;

  @override
  // TODO: implement barrierLabel
  String get barrierLabel => null;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => kThemeAnimationDuration;

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.4),
      child: Center(
        child: _getProgress(),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return super
        .buildTransitions(context, animation, secondaryAnimation, child);
  }

  Widget _getProgress() {
    if (message == null) {
      return Container(
          width: 100.0,
          height: 100.0,
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(10))),
          child: Stack(
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation(progressColor)),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 70.0),
                  child: Text(loadingMessage, style: loadingTextStyle),
                ),
              )
            ],
          ));
    } else {
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(new Radius.circular(10))),
        child: Text(
          message,
          style: messageTextStyle,
        ),
      );
    }
  }
}
