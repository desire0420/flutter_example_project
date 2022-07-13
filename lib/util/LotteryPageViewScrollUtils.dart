
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LotteryPageViewScrollUtils {
  late final PageController pageController;
  late final ScrollController scrollController;

  // Local dragStartDetail.
  DragStartDetails? dragStartDetails;

  // Current drag instance - should be instantiated on overscroll and updated alongside.
  Drag? drag;

  LotteryPageViewScrollUtils({required this.pageController, required this.scrollController});

  bool handleNotification(ScrollNotification notification) {
    //滑动组件结束滑动时
    if (notification is ScrollEndNotification) {
      if (notification.dragDetails != null && drag != null) {
        drag?.end(notification.dragDetails!);
       // print(S.current.the_slide_is_over);
      }
    }

    //滑动越界时
    if (notification is OverscrollNotification) {
      if (notification.dragDetails != null && drag != null) {
        drag?.update(notification.dragDetails!);
       // print(S.current.sliding_is_out_of_bounds);
      }
    }

    // 与start 与end的调用时期一样
    if (notification is UserScrollNotification) {
      //这里我们假设一个竖直方向的ListView  判断是否滚动到头部 或者尾部 且用户继续向头部或者尾部滚动
      //这时候  我们就认为 用户是想要切花页面 pageController  是外层ViewPage的控制器
      //这时候 将通知的DragStartDetails 传入到pageController的drag、里面，即用户的滑动信息和外面的ViewPage 挂钩
      print("---notification.direction---${notification.direction}");
      //滚动到底部
      if (notification.direction == ScrollDirection.reverse &&
          scrollController.position.extentAfter == 0) {
       // print(S.current.scroll_to_the_bottom);
        //生成外部滑动对象 进行滑动

        drag = pageController.position.drag(DragStartDetails(), () {
          drag = null; //滑动结束后会调用
        });
      } else if (notification.direction == ScrollDirection.forward &&
          scrollController.position.extentBefore == 0) {
       // print(S.current.scroll_to_the_head);

        drag = pageController.position.drag(DragStartDetails(), () {
          drag = null;
        });
      }
    }

    return true;
  }
}
