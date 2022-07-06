import 'package:flutter/material.dart';

class LiveClearLayer extends StatefulWidget {
  final Widget children;
  final Function()? onLeftListener;

  const LiveClearLayer({required this.onLeftListener, required this.children}) : super();

  @override
  _LiveClearLayerState createState() => _LiveClearLayerState();
}

class _LiveClearLayerState extends State<LiveClearLayer> with TickerProviderStateMixin {
  bool _isHidden = false;
  double _left = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

   AnimationController? _animationController;
  late Animation<double> _animation;

  void initAnim(double begin, double end) {
    _animationController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _animation = Tween(begin: begin, end: end)
        .animate(CurvedAnimation(parent: _animationController!, curve: Curves.linear));
    _animationController?.addListener(() {
      setState(() {
        if (mounted) {
          _left = _animation.value;
        }
      });
    });
    _animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          _left += details.delta.dx;
          //_left 最大只能为屏幕宽度 一直重复滑动数字超过屏幕 或者小于0
          if (_left > MediaQuery.of(context).size.width) {
            _left = MediaQuery.of(context).size.width;
          } else if (_left < 0) {
            _left = 0;
          }
          if (!_isHidden && _left == 0 && widget.onLeftListener != null) {
            widget.onLeftListener!();
          }
        });
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (_isHidden) {
          if (_left < MediaQuery.of(context).size.width * 0.8) {
            debugPrint("===3====");
            //已经滑动的距离大于屏幕的0.8 且已經隐藏的情况下 开始出现
            initAnim(_left, 0);
            _isHidden = false;
          } else {
            debugPrint("===4====");
            //已经滑动的小于屏幕的0.8 且已經隐藏的情况下 不做任何处理恢复原狀
            initAnim(_left, MediaQuery.of(context).size.width);
            _isHidden = true;
          }
        } else {
          //没有划出隐藏的情况
          if (_left > MediaQuery.of(context).size.width * 0.2) {
            debugPrint("===1====");
            //滑动距离大于屏幕的0.1 且没有隐藏的情况下，开始隐藏
            _isHidden = true;
            initAnim(_left, MediaQuery.of(context).size.width);
          } else if (_left > 0 && _left < MediaQuery.of(context).size.width * 0.2) {
            debugPrint("===2====");
            //滑动距离小于屏幕的0.1 且没有隐藏的情况下  不做任何处理恢复原狀
            _isHidden = false;
            initAnim(_left, 0);
          }
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              left: _left,
              top: 0,
              right: -_left,
              bottom: 0,
              child: widget.children,
            )
          ],
        ),
      ),
    );
  }
}
