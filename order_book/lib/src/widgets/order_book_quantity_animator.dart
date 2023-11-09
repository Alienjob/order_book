import 'package:flutter/material.dart';
import 'package:order_book/src/service/style.dart';
import 'package:order_book/src/widgets/order_book_quantity_indicator.dart';

class OrderBookQuantityAnimator extends StatefulWidget {
  const OrderBookQuantityAnimator({super.key, required this.child});

  final OrderBookQuantityIndicator child;

  @override
  State<OrderBookQuantityAnimator> createState() =>
      _OrderBookQuantityAnimatorState();
}

class _OrderBookQuantityAnimatorState extends State<OrderBookQuantityAnimator>
    with TickerProviderStateMixin {
  late int _flexDataPrev;
  late int _flexData;

  late int _flexTransparentPrev;
  late int _flexTransparent;

  late Animation<double> _animationData;
  late Animation<double> _animationTransparent;
  late Tween<double> _tweenData;
  late Tween<double> _tweenTransparent;
  late AnimationController _animationController;

  @override
  void initState() {
    _flexData = widget.child.flexData;
    _flexDataPrev = 0;
    _flexTransparent = widget.child.flexTransparent;
    _flexTransparentPrev = 100;

    _animationController =
        AnimationController(duration: OrderBookStyle.indicatorAnimationDuration, vsync: this);
    _tweenData = Tween(begin: 0.0, end: _flexData.toDouble());
    _tweenTransparent = Tween(begin: 0.0, end: _flexData.toDouble());
    _animationData = _tweenData.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationTransparent = _tweenTransparent.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void setNewPosition() {
    _tweenData.begin = _tweenData.end;
    _tweenTransparent.begin = _tweenTransparent.end;
    _animationController.reset();
    _tweenData.end = _flexData.toDouble();
    _tweenTransparent.end = _flexTransparent.toDouble();
    _animationController.forward();
  }

  @override
  void didUpdateWidget(OrderBookQuantityAnimator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((_flexData != widget.child.flexData)) {
      setState(() {
        _flexDataPrev = _flexData;
        _flexData = widget.child.flexData;
      });
      setNewPosition();
    }
    if (_flexTransparent != widget.child.flexTransparent) {
      setState(() {
        _flexTransparentPrev = _flexTransparent;
        _flexTransparent = widget.child.flexTransparent;
      });
      setNewPosition();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrderBookQuantityIndicator(
      aligement: widget.child.aligement,
      flexData: _animationData.value.round(),
      flexTransparent: _animationTransparent.value.round(),
      indicatorColor: widget.child.indicatorColor,
    );
  }
}
