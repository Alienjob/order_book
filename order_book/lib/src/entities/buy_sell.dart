import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum BuySell {
  @JsonValue(0)
  buy,
  @JsonValue(1)
  sell,
}

extension BuySellExtension on BuySell {
  String getName() {
    switch (this) {
      case BuySell.buy:
        return 'Buy';
      case BuySell.sell:
        return 'Sell';
    }
  }

  String getNameSide() {
    switch (this) {
      case BuySell.buy:
        return 'Buy';
      case BuySell.sell:
        return 'Sell';
    }
  }

  Color get getColor {
    switch (this) {
      case BuySell.buy:
        return Colors.green;
      case BuySell.sell:
        return Colors.red;
    }
  }

  String get key {
    switch (this) {
      case BuySell.buy:
        return "Bid";
      case BuySell.sell:
        return "Ask";
    }
  }

  int get number {
    switch (this) {
      case BuySell.buy:
        return 0;
      case BuySell.sell:
        return 1;
    }
  }
}
