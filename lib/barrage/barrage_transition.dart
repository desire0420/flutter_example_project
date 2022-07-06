import 'package:flutter/material.dart';

/// des: 弹幕平移
class BarrageTransition extends StatefulWidget {
  final Widget child; //弹幕布局
  final Duration duration; //平移时间（秒）
  final ValueChanged onComplete; //滚动完成回调

  const BarrageTransition({Key? key, required this.child, required this.duration, required this.onComplete})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => BarrageTransitionState();
}

class BarrageTransitionState extends State<BarrageTransition> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  bool get isComplete => _animationController.isCompleted;

  @override
  void initState() {
    _animationController = AnimationController(duration: widget.duration, vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onComplete('');
        }
      });
    var begin = const Offset(0.9, .0);
    var end = const Offset(-1.0, .0);

    _animation = Tween(begin: begin, end: end).animate(_animationController);
    //开始动画
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
