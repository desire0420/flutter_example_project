import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PageViewBody extends StatefulWidget {
  final int index;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const PageViewBody({this.index = 0, required this.scaffoldKey});

  @override
  State<StatefulWidget> createState() {
    return _PageViewBodyState();
  }
}

class _PageViewBodyState extends State<PageViewBody> {
  //获取指定范围内的 int 类型随机数
  //这里是 0~100
  int randomInt = Random().nextInt(100);
  int currentPage = 1;

  double drawerEdgeDragWidth = 20;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPage);
    _controller?.addListener(() {});
  }

  PageController? _controller;

  @override
  void dispose() {
    super.dispose();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double _leftTotalMoveDx = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerDragStartBehavior: DragStartBehavior.start,
      drawerScrimColor: Colors.transparent,
      endDrawerEnableOpenDragGesture: currentPage == 1,
      onEndDrawerChanged: (isOpened) {},
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 160),
        child: Drawer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin: EdgeInsets.only(top: 90), child: Icon(Icons.child_friendly)),
              Container(
                color: Colors.white,
                width: 130,
                child: Center(
                  child: Column(
                    children: const [
                      Text("item 1"),
                      Text("item 1"),
                      Text("item 1"),
                      Text("item 1"),
                      Text("item 1"),
                      Text("item 1"),
                      Text("item 1"),
                      Text("item 1")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          //滑动越界时 用于处理侧边栏的滑动
          if (notification is OverscrollNotification) {
            double moveDx = notification.dragDetails?.delta.dx ?? 0;
            _leftTotalMoveDx += moveDx;
            if (_leftTotalMoveDx > MediaQuery.of(context).size.width * 0.2 && currentPage == 1) {}
            scaffoldKey.currentState?.openEndDrawer();
            _leftTotalMoveDx = 0;
          }
          return false;
        },
        child: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          child: PageView(
              //当页面选中后回调此方法
              //参数[index]是当前滑动到的页面角标索引 从0开始
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              controller: _controller,
              //滑动到页面底部无回弹效果
              physics: const AlwaysScrollableScrollPhysics(),
              //纵向滑动切换
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(10),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: double.infinity,
                  color: Color(0x47dd3434),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(margin: EdgeInsets.only(top: 60), child: Icon(Icons.ice_skating_outlined)),
                      InkWell(
                        child: Text("为你推荐"),
                        onTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
                      Container(child: Text("DPage")),
                      Text("DPage"),
                      Text("DPage"),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
