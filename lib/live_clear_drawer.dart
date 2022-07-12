import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveClearDrawer extends StatefulWidget {
  const LiveClearDrawer();

  @override
  State<StatefulWidget> createState() {
    return _LiveClearDrawerState();
  }
}

class _LiveClearDrawerState extends State<LiveClearDrawer> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    debugPrint("----initState");
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    debugPrint("----dispose");
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: scaffoldKey,
      drawerEdgeDragWidth: 400,
      drawerScrimColor: Colors.transparent,
      endDrawerEnableOpenDragGesture: true,
      drawerEnableOpenDragGesture: false,
      onEndDrawerChanged: (isOpened) {
        debugPrint("-----isOpened----$isOpened");
      },
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      endDrawer: Drawer(
        child: Center(
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.child_friendly),
                title: Text("item 1"),
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          debugPrint("-----details.delta.dx----${details.delta.dx}");
        },
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin: EdgeInsets.only(top: 60), child: Icon(Icons.ice_skating_outlined)),
              InkWell(
                child: Text("为你推荐"),
                onTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              Text("DPage"),
              Text("DPage"),
              Text("DPage"),
            ],
          ),
        ),
      ),
    );
  }
}
