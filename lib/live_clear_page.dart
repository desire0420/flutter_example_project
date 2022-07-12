import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_demo/page_view_body.dart';

import 'asset_utils.dart';

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
  var list = [AssetUtils.guide1, AssetUtils.guide2, AssetUtils.guide3, AssetUtils.guide4];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PageView.builder(
            //当页面选中后回调此方法
            //参数[index]是当前滑动到的页面角标索引 从0开始
            onPageChanged: (int index) {},
            itemCount: list.length,
            //滑动到页面底部无回弹效果
            physics: const BouncingScrollPhysics(),
            //纵向滑动切换
            scrollDirection: Axis.vertical,
            //所有的子Widget
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Image.asset(
                    list[index],
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  PageViewBody(
                    index: index,
                    scaffoldKey: scaffoldKey,
                  ),
                ],
              );
            }));
  }
}
