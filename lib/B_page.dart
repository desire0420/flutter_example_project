import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_demo/util/color_util.dart';

class BPage extends StatefulWidget {
  final int index;
  const BPage({this.index=0});

  @override
  State<StatefulWidget> createState() {
    return _BPageState();
  }
}

class _BPageState extends State<BPage> {
  Function(dynamic arg) call() => (dynamic arg) {
        debugPrint("---BPage--eventBus--");
      };

  late StreamSubscription loginSubscription;

  @override
  void initState() {
    super.initState();
    debugPrint("--BPage--initState--${widget.index}");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("--BPage--build---${widget.index}");

    return Scaffold(
      body: Container(
        child: const Text("BPage"),
        color: ColorUtil.getRandomColor(),
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
