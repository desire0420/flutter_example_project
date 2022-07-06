import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_demo/util/color_util.dart';

import 'live_clear_layer.dart';

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

  @override
  void initState() {
    super.initState();
    debugPrint("--PageViewBody--initState--${randomInt}");
  }

  bool vis = true;

  @override
  void dispose() {
    super.dispose();
    debugPrint("--PageViewBody--dispose---${randomInt}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            color: ColorUtil.getRandomColor(),
            width: double.infinity,
            height: double.infinity,
          ),
          LiveClearLayer(
              children: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("DPage"),
                    Text("DPage"),
                    Text("DPage"),
                  ],
                ),
              ),
              onLeftListener: () {
                widget.scaffoldKey.currentState?.openEndDrawer();
              })
        ],
      ),
    );
  }
}
