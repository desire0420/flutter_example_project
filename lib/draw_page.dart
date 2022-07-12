import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_demo/util/color_util.dart';

class DrawPage extends StatefulWidget {
  final int index;
  const DrawPage({this.index=0});

  @override
  State<StatefulWidget> createState() {
    return _DrawPageState();
  }
}

class _DrawPageState extends State<DrawPage> {


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
    return Scaffold(
      drawerEdgeDragWidth: 500.0,
      drawerScrimColor: Colors.transparent,
      endDrawerEnableOpenDragGesture: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("draw"),
      ),
      body: Center(
        child:  Text(
          'hello world',
        ),
      ),
      endDrawer: new Drawer(


        child: Center(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                leading: Icon(Icons.child_friendly),
                title: new Text("item 1"),
              ),
              new ListTile(
                leading: Icon(Icons.child_friendly),
                title: new Text("item 2"),
              ),
              new ListTile(
                leading: Icon(Icons.child_friendly),
                title: new Text("item 3"),
              ),
              new ListTile(
                leading: Icon(Icons.child_friendly),
                title: new Text("item 4"),
              ),
            ],
          ),
        ),),
    );
  }
}
