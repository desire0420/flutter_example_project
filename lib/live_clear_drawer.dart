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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(margin: EdgeInsets.only(top: 60), child: Icon(Icons.ice_skating_outlined)),
        Container(
          width: 125,
          color: const Color(0x80000000),
          child: const Center(
            child: Text("LiveClearDrawer"),
          ),
        )
      ],
    );
  }
}
