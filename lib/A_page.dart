import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class APage extends StatefulWidget {
  const APage();

  @override
  State<StatefulWidget> createState() {
    return _APageState();
  }
}

class _APageState extends State<APage> {
  late StreamSubscription loginSubscription;

  @override
  void initState() {
    super.initState();
    debugPrint("---APage--initState--");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("APage"),
          centerTitle: true,
        ),
        body: Text("APage"));
  }
}
