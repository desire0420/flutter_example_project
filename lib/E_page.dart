import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_demo/util/color_util.dart';

class EPage extends StatefulWidget {
  final int index;

  const EPage({this.index = 0});

  @override
  State<StatefulWidget> createState() {
    return _EPageState();
  }
}

class _EPageState extends State<EPage> {
  @override
  void initState() {
    super.initState();
    debugPrint("--EPage--initState--");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("--EPage--dispose--");

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Text("EPage"),
      color: ColorUtil.getRandomColor(),
      width: double.infinity,
    );
  }
}
