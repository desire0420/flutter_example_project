import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_test_demo/pageview/example.dart';

import 'A_page.dart';
import 'WebViewExample.dart';
import 'barrage/barrage.dart';
import 'barrage/huya_barrage.dart';
import 'live_clear_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LiveClearPage(),
    );
  }
}

class BarrageTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BarrageTest();
}

class _BarrageTest extends State<BarrageTest> {
  var _barrageKey = GlobalKey<BarrageState>();

  int mills = 500;
  int showCount = 6;
  Timer? _timer;
  TextEditingController? _millsController;
  TextEditingController? _showController;

  List<String> values = [
    '66666666666666666666666666',
    '男人没有等到 3 分钟之后。',
    '但她还是按照计划，一本正经地在心里默念',
    '代号 07 沉默不语。',
    '发弹幕的这位，我觉得你很有想法…',
    '出自鼹鼠的故事',
    'PS.大家想收录就收录，想转载就转载',
    '刘备浇水…',
    '最新实体弹幕！',
    '琴瑟琵琶，八大王一般头面',
  ];

  @override
  void initState() {
    _millsController = TextEditingController()..text = mills.toString();
    _showController = TextEditingController()..text = showCount.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            color: Colors.blue,
            child: Barrage(
              key: _barrageKey,
              showCount: 3,
            ),
          ),
          SizedBox(height: 40),
          RaisedButton(
            child: Text('发送'),
            onPressed: () {
              Random random = Random();
              int _random = random.nextInt(values.length);
              var text = values[_random];
              // _barrageKey.currentState?.addBarrage(HuyaBarrage.level_1(text));
              //
              // _barrageKey.currentState?.addBarrage(HuyaBarrage.level_2(text));

              _barrageKey.currentState?.addBarrage(HuyaBarrage.level_3(text, 20));
            },
          )
        ],
      ),
    );
  }
}
