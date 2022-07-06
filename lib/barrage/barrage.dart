import 'dart:math';

import 'package:flutter/material.dart';

import 'barrage_transition.dart';

class Barrage extends StatefulWidget {
  const Barrage(
      {Key? key,
      this.showCount = 10,
      this.padding = 5,
      this.randomOffset = 0,
      this.duration = const Duration(seconds: 5)})
      : super(key: key);

  final Duration duration; //彈幕滚动时间

  final int showCount; //显示的行数

  final double padding; //水平弹幕：表示top、bottom的padding

  final int randomOffset; //随机偏移量

  @override
  State<StatefulWidget> createState() => BarrageState();
}

class BarrageState extends State<Barrage> {
  final List<_BarrageTransitionItem> _barrageList = []; //弹幕列表
  final Random _random = Random();
  late double _height;
  int barrageIndex = 0;

  ///
  /// 添加弹幕
  ///
  void addBarrage(Widget child) {
    double perRowHeight = (_height - 2 * widget.padding) / widget.showCount;
    //计算距离顶部的偏移，
    // 不直接使用_barrageList.length的原因：弹幕结束会删除列表中此项，如果
    // 此时正好有一个弹幕来，会造成此弹幕和上一个弹幕同行
    var index = 0;
    if (_barrageList.isEmpty) {
      //屏幕中没有弹幕，从顶部开始
      index = 0;
      barrageIndex++;
    } else {
      index = barrageIndex++;
    }
    var top = _computeTop(index, perRowHeight);
    if (barrageIndex > 100000) {
      //避免弹幕数量一直累加超过int的最大值
      barrageIndex = 0;
    }
    var bottom = _height - top - perRowHeight;
    //给每一项生成一个唯一id，用于删除
    String id = '${DateTime.now().toIso8601String()}:${_random.nextInt(1000)}';
    var item = _BarrageTransitionItem(
      id: id,
      top: top,
      bottom: bottom,
      child: child,
      onComplete: _onComplete,
      duration: widget.duration,
    );
    _barrageList.add(item);
    setState(() {});
  }

  //动画执行完毕删除
  void _onComplete(id) {
    _barrageList.removeWhere((f) {
      return f.id == id;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraintType) {
        _height = constraintType.maxHeight;
        print("-------${_height}");
        return ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Stack(
            children: [..._barrageList],
          ),
        );
      },
    );
  }

  ///
  /// 计算每一行距顶部的偏移，将显示弹幕分为[showCount]份，如果弹幕的比[showCount]多，
  /// 第二轮显示在2个【111111】中间，如下：
  ///
  /// 11111111111111
  ///             2222222
  /// 11111111111111
  ///           2222222
  /// 11111111111111
  ///           2222222
  /// 11111111111111
  ///
  double _computeTop(int index, double perRowHeight) {
    //第几轮弹幕
    int num = (index / widget.showCount).floor();
    double top = (index % widget.showCount) * perRowHeight + widget.padding;

    if (num % 2 == 1 && index % widget.showCount != widget.showCount - 1) {
      //第二轮在第一轮2行弹幕中间
      top += perRowHeight / 2;
    }
    if (widget.randomOffset != 0 && top > widget.randomOffset) {
      top += _random.nextInt(widget.randomOffset) * 2 - widget.randomOffset;
    }
    return top;
  }

  @override
  void dispose() {
    _barrageList.clear();
    super.dispose();
  }
}

class _BarrageTransitionItem extends StatelessWidget {
  _BarrageTransitionItem(
      {this.id,
      this.top,
      this.bottom,
      required this.child,
      required this.onComplete,
      required this.duration});

  final String? id;
  final double? top;
  final double? bottom;
  final Widget child;
  final ValueChanged onComplete;
  final Duration duration;
  final _key = GlobalKey<BarrageTransitionState>();

  bool get isComplete => _key.currentState?.isComplete ?? false;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: top,
      bottom: bottom,
      child: BarrageTransition(
        key: _key,
        child: child,
        onComplete: (v) {
          onComplete(id);
        },
        duration: duration,
      ),
    );
  }
}
