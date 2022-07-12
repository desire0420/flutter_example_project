import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'live_clear_drawer.dart';

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

  @override
  void initState() {
    super.initState();
    debugPrint("--PageViewBody--initState--${randomInt}");
    _controller = PageController(initialPage: currentPage);
    _controller?.addListener(() {});
  }

  bool vis = true;
  PageController? _controller;

  bool endDrawerEnableGesture = false;

  @override
  void dispose() {
    super.dispose();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEdgeDragWidth: double.infinity,
      drawerScrimColor: Colors.transparent,
      endDrawerEnableOpenDragGesture: false,
      onEndDrawerChanged: (isOpened) {
        debugPrint("-----isOpened----${isOpened}");
      },
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      endDrawer: Drawer(
        child: Center(
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.child_friendly),
                title: Text("item 1"),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: Listener(
          onPointerDown: (PointerDownEvent event) {},
          onPointerUp: (PointerUpEvent event) {
            // debugPrint("-----currentPage----${currentPage}");
            // if (currentPage == 1) {
            //   scaffoldKey.currentState?.openEndDrawer();
            // }

          },
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
                LiveClearDrawer()
              ]),
        ),
      ),
    );
  }
}
