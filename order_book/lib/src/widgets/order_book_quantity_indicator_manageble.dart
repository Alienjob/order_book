import 'package:flutter/material.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/widgets/order_book_quantity_animator.dart';
import 'package:order_book/src/widgets/order_book_quantity_indicator.dart';
import 'package:order_book/src/widgets/order_book_total_indicator_manager.dart';

class OrderBookQuantityIndicatorManageble extends StatefulWidget {
  const OrderBookQuantityIndicatorManageble({
    super.key,
    required this.id,
    required this.aligement,
    required this.total,
    required this.indicatorColor,
  });

  final double id;
  final OrderBookCrossAxisAlignment aligement;
  final Color indicatorColor;
  final double total;

  @override
  State<OrderBookQuantityIndicatorManageble> createState() =>
      _OrderBookQuantityIndicatorManagebleState();
}

class _OrderBookQuantityIndicatorManagebleState
    extends State<OrderBookQuantityIndicatorManageble> {
  static const double flexPrecision = 1000;

  double _total = 0;
  double _maxTotal = 0;

  late void Function(double id, State volume, double total) onInit;
  late void Function(double id) onDispose;

  @override
  void initState() {
    super.initState();
    _total = widget.total;
  } 

  @override
  void didChangeDependencies() {
    var manager = OrderBookTotalIndicatorInherited.of(context);
    // _maxTotal = manager.maxStaircaseTotal;
    onInit = manager.onInit;
    onDispose = manager.onDispose;
    onInit(widget.id, this, widget.total);
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  void didUpdateWidget(OrderBookQuantityIndicatorManageble oldWidget) {
    super.didUpdateWidget(oldWidget);
    onInit(widget.id, this, widget.total);
    _total = widget.total;
    setState(() {});
  }

  int _flexTransparent(double max) => ((max - _total) * flexPrecision).round();

  // возможно data.total - minStaircaseTotal
  int _flexData() => ((_total) * flexPrecision).round();

  @override
  Widget build(BuildContext context) {
    var manager = OrderBookTotalIndicatorInherited.of(context);
    _maxTotal = manager.maxStaircaseTotal;
    final int flexTransparent = _flexTransparent(_maxTotal);
    final int flexData = _flexData();
    return OrderBookQuantityAnimator(
      child: OrderBookQuantityIndicator(
          aligement: widget.aligement,
          flexTransparent: flexTransparent,
          flexData: flexData,
          indicatorColor: widget.indicatorColor),
    );
  }

  @override
  deactivate() {
    super.deactivate();
    onDispose(widget.id);
  }

  @override
  dispose() {
    super.dispose();

  }
}
