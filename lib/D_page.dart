import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_demo/util/color_util.dart';

class DPage extends StatefulWidget {
  final int index;

  const DPage({this.index = 0});

  @override
  State<StatefulWidget> createState() {
    return _DPageState();
  }
}

class _DPageState extends State<DPage> {
  int randomInt = Random().nextInt(100);

  @override
  void initState() {
    super.initState();
    debugPrint("--DPage--initState--$randomInt");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("--DPage--dispose--$randomInt");

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Text("DPage"),
      color: ColorUtil.getRandomColor(),
      width: double.infinity,
    );
  }
}
