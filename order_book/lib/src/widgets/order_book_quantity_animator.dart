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
  double _widthPrev = 0;
  double _width = 0;

  late Animation<double> _animationWidth;
  late Tween<double> _tweenWidth;
  late AnimationController _animationController;

  @override
  void initState() {
    _width = widget.child.width;
    _widthPrev = widget.child.width;

    _animationController = AnimationController(
        duration: OrderBookStyle.indicatorAnimationDuration, vsync: this);
    _tweenWidth = Tween(begin: 0.0, end: _width);
    _animationWidth = _tweenWidth.animate(_animationController)
      ..addListener(() {
        if (mounted) setState(() {});
      });
    setNewPosition();

    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void setNewPosition() {
    _tweenWidth.begin = _widthPrev;
    _tweenWidth.end = _width;
    _animationController.reset();

    _animationController.forward();
  }

  @override
  void didUpdateWidget(OrderBookQuantityAnimator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((_width != widget.child.width)) {
      if (mounted) {
        setState(() {
          _widthPrev = _animationWidth.value;
          _width = widget.child.width;
        });
      }
      setNewPosition();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrderBookQuantityIndicator(
      aligement: widget.child.aligement,
      width: _animationWidth.value,
      indicatorColor: widget.child.indicatorColor,
    );
  }
}
