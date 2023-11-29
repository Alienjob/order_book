import 'dart:math';

import 'package:collection/collection.dart';
import 'package:decimal/decimal.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/entities/buy_sell.dart';
import 'package:order_book/src/entities/order_book_askbid_entity.dart';
import 'package:order_book/src/entities/order_book_change_entity.dart';
import 'package:order_book/src/entities/order_book_entity.dart';

class OrderBookEntitySet {
  List<OrderBookEntity> entities = List.empty(growable: true);
  List<OrderBookChangeEntity> changes = List.empty(growable: true);

  // соединяет entitys и changes
  // по времени с учетом наложений
  // и выдает результирующую книгу
  OrderBookData makeBookData() {
    int makeTime = 0;

    Map<Decimal, int> askPriceTime = {};
    Map<Decimal, Decimal> askPriceQuantity = {};
    Map<Decimal, int> bidPriceTime = {};
    Map<Decimal, Decimal> bidPriceQuantity = {};
    Map<Decimal, DateTime> askPriceUpdateTime = {};
    Map<Decimal, DateTime> bidPriceUpdateTime = {};

    final timeEntities = _getTimeEntities();
    final timeEntitiesKeys = timeEntities.keys.sorted((a, b) => a.compareTo(b));
    for (final time in timeEntitiesKeys) {
      _updateFromEntity(
          time, timeEntities[time]?.asks ?? [], askPriceTime, askPriceQuantity);
      _updateFromEntity(
          time, timeEntities[time]?.bids ?? [], bidPriceTime, bidPriceQuantity);
      makeTime = max(time, makeTime);
    }

    final timeChanges = _getTimeChanges();
    final timeChangesKeys = timeChanges.keys.sorted((a, b) => a.compareTo(b));
    for (final time in timeChangesKeys) {
      final change = timeChanges[time]!;
      if (change.side == BuySell.buy) {
        _updateFromChange(time, change, bidPriceTime, bidPriceUpdateTime, bidPriceQuantity);
      } else {
        _updateFromChange(time, change, askPriceTime, askPriceUpdateTime, askPriceQuantity);
      }
      makeTime = max(time, makeTime);
    }

    return OrderBookData(
      timeStamp: makeTime,
      askPriceQuantity: askPriceQuantity,
      bidPriceQuantity: bidPriceQuantity,
      askPriceTime: askPriceTime,
      bidPriceTime: bidPriceTime,
      askPriceUpdateTime: askPriceUpdateTime,
      bidPriceUpdateTime: bidPriceUpdateTime,
    );
  }

  void _updateFromEntity(
    int time,
    List<OrderBookAskBidEntity> list,
    Map<Decimal, int> priceTime,
    Map<Decimal, Decimal> priceQuantity,
  ) {
    for (final askBidEntity in list) {
      Decimal price = askBidPrice(askBidEntity);
      if ((priceTime[price] == null) || (priceTime[price]! < (time))) {
        priceTime[price] = time;
        priceQuantity[price] = askBidQuantity(askBidEntity);
      }
    }
  }

  void _updateFromChange(
    int time,
    OrderBookChangeEntity change,
    Map<Decimal, int> priceTime,    
    Map<Decimal, DateTime> updateTime,
    Map<Decimal, Decimal> priceQuantity,
  ) {
    Decimal price = changePrice(change);
    if ((priceTime[price] == null) || (priceTime[price]! < (time))) {
      priceTime[price] = time;
      priceQuantity[price] = changeQuantity(change);
      updateTime[price] = DateTime.now();
    }
  }

  Map<int, OrderBookEntity> _getTimeEntities() {
    Map<int, OrderBookEntity> result = {};

    for (final entity in entities) {
      int timestamp = entity.timestamp ?? 0;
      while (result[timestamp] != null) {
        timestamp = timestamp + 1;
      }
      result[timestamp] = entity;
    }

    return result;
  }

  Map<int, OrderBookChangeEntity> _getTimeChanges() {
    Map<int, OrderBookChangeEntity> result = {};

    for (final change in changes) {
      int timestamp = change.timestamp ?? 0;
      while (result[timestamp] != null) {
        timestamp = timestamp + 1;
      }
      result[timestamp] = change;
    }

    return result;
  }
}

