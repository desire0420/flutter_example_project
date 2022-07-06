import 'package:flutter/material.dart';

/**
 * 页面切换过度动画
 *
 */

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute(this.page)
      : super(
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder:
          (BuildContext context, Animation<double> animation1, Animation<double> animation2) {
        return page;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation1,
          Animation<double> animation2, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
          child: child,
        );
      });
}


