import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_demo/util/color_util.dart';

class FPage extends StatefulWidget {
  final int index;

  const FPage({this.index = 0});

  @override
  State<StatefulWidget> createState() {
    return _FPageState();
  }
}

class _FPageState extends State<FPage> {
  @override
  void initState() {
    super.initState();
    debugPrint("--FPage--initState--");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("--FPage--dispose--");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Text("FPage"),
      color: ColorUtil.getRandomColor(),
      width: double.infinity,
    );
  }
}
