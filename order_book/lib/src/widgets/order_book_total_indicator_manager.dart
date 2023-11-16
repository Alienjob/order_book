import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:order_book/src/service/style.dart';

// Виджет
class _OrderBookTotalIndicatorManager extends StatefulWidget {
  const _OrderBookTotalIndicatorManager({super.key, required this.child});

  final Widget child;

  @override
  State<_OrderBookTotalIndicatorManager> createState() => _OrderState();
}

// Стейт
class _OrderState extends State<_OrderBookTotalIndicatorManager> {
  final _TotalIndicatorStore _store = _TotalIndicatorStore();
  final _VisiblityStore _visiblyStore = _VisiblityStore();
  Timer? _updateTimer;

  void onInit(double key, State volume, double total) {
    _visiblyStore.add(key, volume);
    _store.add(key, total);
  }

  void onDispose(double key) {
    _visiblyStore.remove(key);
    _store.remove(key);
  }

  @override
  void didUpdateWidget(covariant _OrderBookTotalIndicatorManager oldWidget) {
    _updateTimer?.cancel();
    _updateTimer = null;
    _updateTimer =
        Timer.periodic(OrderBookStyle.updateVisibleDataFrequency, (timer) {
      if (context.mounted) {
        setState(() {});
      }
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    _updateVisibleStrict(context);
    return OrderBookTotalIndicatorInherited(
      onInit: onInit,
      onDispose: onDispose,
      maxStaircaseTotal:
          _store.getMaxStaircaseTotal(_visiblyStore.getVisibleKeys()),
      child: widget.child,
    );
  }

  void _updateVisibleStrict(BuildContext context) {
    final ro = context.findRenderObject();
    if ((ro is RenderBox) && (ro.hasSize)) {
      Offset position = ro.localToGlobal(Offset.zero);
      Size size = ro.size;
      _visiblyStore.minY = position.dy;
      _visiblyStore.maxY = position.dy + size.height;
    }
  }

  @override
  void dispose() {
    _updateTimer?.cancel();
    _updateTimer = null;
    super.dispose();
  }
}

// Инхеритед
class OrderBookTotalIndicatorInherited extends InheritedWidget {
  const OrderBookTotalIndicatorInherited({
    super.key,
    required this.onInit,
    required this.onDispose,
    required super.child,
    required this.maxStaircaseTotal,
  });

  final void Function(double key, State volume, double total) onInit;
  final void Function(double key) onDispose;

  final double maxStaircaseTotal;

  static OrderBookTotalIndicatorInherited? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<OrderBookTotalIndicatorInherited>();
  }

  static OrderBookTotalIndicatorInherited of(BuildContext context) {
    final OrderBookTotalIndicatorInherited? result = maybeOf(context);
    assert(
        result != null, 'No OrderBookTotalIndicatorInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(OrderBookTotalIndicatorInherited oldWidget) =>
      oldWidget.maxStaircaseTotal != maxStaircaseTotal;
}

// Сторы
class _TotalIndicatorStore {
  final Map<double, double> _registred = {};

  _TotalIndicatorStore();

  add(double key, double total) {
    _registred[key] = total;
  }

  remove(double key) {
    _registred.remove(key);
  }

  double getMaxStaircaseTotal(List<double> keys) {
    if (keys.isEmpty) return 1;
    if (keys.length == 1) return _registred.values.first;
    final result = _registred.entries
        .where((e) => keys.contains(e.key))
        .map<double>((e) => e.value)
        .reduce(max);
    return result;
  }
}

class _VisiblityStore {
  final Map<double, State> _registred = {};

  double minY = 0;
  double maxY = double.infinity;

  _VisiblityStore();

  add(double key, State volume) {
    _registred[key] = volume;
  }

  remove(double key) {
    _registred.remove(key);
  }

  List<double> getVisibleKeys() {
    final List<double> result = [];
    for (final e in _registred.entries) {
      //print('${e.key} mounted ${e.value.mounted}');
      if (e.value.mounted) {
        final ro = e.value.context.findRenderObject();
        //print('${e.key} ro $ro');
        if (ro != null) {
          if ((ro is RenderBox) && (ro.hasSize)) {
            Offset p = ro.localToGlobal(Offset.zero);
            Size s = ro.size;
            if ((p.dy + s.height > minY) && (p.dy < maxY)) {
              result.add(e.key);
            }
          }
        }
      }
    }
    return result;
  }
}
