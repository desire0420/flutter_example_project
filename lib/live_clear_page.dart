import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_demo/page_view_body.dart';

import 'live_clear_drawer.dart';

class LiveClearPage extends StatefulWidget {
  const LiveClearPage();

  @override
  State<StatefulWidget> createState() {
    return _LiveClearPageState();
  }
}

class _LiveClearPageState extends State<LiveClearPage> {
  List<Widget> childrenWidget = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool showLady = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawerScrimColor: Colors.transparent,
        endDrawerEnableOpenDragGesture: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        endDrawer: const LiveClearDrawer(),
        appBar: AppBar(
          title: const Text("liveClear"),
          centerTitle: true,
        ),
        body: PageView.builder(
            //当页面选中后回调此方法
            //参数[index]是当前滑动到的页面角标索引 从0开始
            onPageChanged: (int index) {},
            //滑动到页面底部无回弹效果
            physics: const BouncingScrollPhysics(),
            //纵向滑动切换
            scrollDirection: Axis.vertical,
            //所有的子Widget
            itemBuilder: (BuildContext context, int index) {
              return PageViewBody(
                index: index,
                scaffoldKey: scaffoldKey,
              );
            }));
  }
}
