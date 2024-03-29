import 'dart:math';

import 'package:flutter/material.dart';
import 'package:visiblity_data_manager/visiblity_data_manager.dart';

import '../domain/model.dart';

class StaircaseData {
  final double minTotal;
  final double maxTotal;

  StaircaseData(this.minTotal, this.maxTotal);
}

class StaircaseDataStore
    extends VisiblityCalculableDataStore<OrderBookTileData, StaircaseData> {
  @override
  void update(StaircaseData data) {
    if ((data.minTotal != this.data?.minTotal) ||
        (data.maxTotal != this.data?.maxTotal)) {
      this.data = data;
      super.update(data);
    }
  }

  @override
  StaircaseData? calculate(List<Key> keys) {
    double maxTotal = 0;
    double minTotal = 0;
    for (var key in keys) {
      double total = registred[key]?.total ?? 0;
      maxTotal = max(maxTotal, total);
      minTotal = min(minTotal, total);
    }
    super.calculate(keys);
    return StaircaseData(minTotal, maxTotal);
  }
}
