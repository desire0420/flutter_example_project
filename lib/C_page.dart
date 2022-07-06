import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
abstract class EventCallBack {
  eventCall() {}
}*/

abstract class EventBusCallBack {
  Function(dynamic arg) callBus();
}

class CPage extends StatefulWidget {
  const CPage();


  @override
  State<StatefulWidget> createState() {
    return _CPageState();
  }
}

class _CPageState extends State<CPage> {
  Function(dynamic) call = (dynamic arg) {
    debugPrint("---CPage--eventBus--");
  };
  @override
  void initState() {
    super.initState();
    debugPrint("---CPage--initState--");


  }

  late StreamSubscription loginSubscription;

  @override
  void dispose() {
    super.dispose();
    debugPrint("---CPage--dispose--");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("CPage"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () {

              },
              child: Container(padding: const EdgeInsets.all(50), child: const Text("C发送EventBus"))),
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  child: const Text("CPage"),
                  color: const Color(0xFFBD2BCA),
                  width: double.infinity,
                  height: 500))
        ],
      ),
    );
  }
}
