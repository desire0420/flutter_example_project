import 'package:flutter/material.dart';

import 'custom_page_anim.dart';

//CupertinoPageRoute  MaterialPageRoute
class NavigatorUtils {
  //valueSetter   跳转下一个界面  携带参数返回
  static void push(BuildContext context, Widget widget, {ValueSetter<dynamic>? valueSetter}) {
    Navigator.push(context, CustomPageRoute(widget)).then((param) {
      if (null != valueSetter) {
        valueSetter(param);
      }
    });
  }

  //替换当前页面，并且当新页面动画执行完成之后，disposing前一个页面。
  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, CustomPageRoute(widget));
  }

  //跳转到指定页面，并按顺序（从栈顶到栈底）移出之前的所有页面，直到predicate返回true。
  static void pushAndRemoveUntil(BuildContext context, Widget widget) {
    // ignore: unnecessary_null_comparison
    Navigator.pushAndRemoveUntil(context, new CustomPageRoute(widget), (route) => route == null);
  }

  static void pushNamed(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }
}
