
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
    DateTime makeTime = DateTime.parse("2000-01-01");

    Map<Decimal, DateTime> askPriceTime = {};
    Map<Decimal, Decimal> askPriceQuantity = {};
    Map<Decimal, DateTime> bidPriceTime = {};
    Map<Decimal, Decimal> bidPriceQuantity = {};

    final timeEntities = _getTimeEntities();
    final timeEntitiesKeys = timeEntities.keys.sorted((a, b) => a.compareTo(b));
    for (final time in timeEntitiesKeys) {
      _updateFromEntity(
          time, timeEntities[time]?.asks ?? [], askPriceTime, askPriceQuantity);
      _updateFromEntity(
          time, timeEntities[time]?.bids ?? [], bidPriceTime, bidPriceQuantity);
      makeTime = _maxT(time, makeTime);
    }

    final timeChanges = _getTimeChanges();
    final timeChangesKeys = timeChanges.keys.sorted((a, b) => a.compareTo(b));
    for (final time in timeChangesKeys) {
      final change = timeChanges[time]!;
      if (change.side == BuySell.buy) {
        _updateFromChange(time, change, bidPriceTime, bidPriceQuantity);
      } else {
        _updateFromChange(time, change, askPriceTime, askPriceQuantity);
      }
      makeTime = _maxT(time, makeTime);
    }

    return OrderBookData(

      timeStamp: makeTime,
      askPriceQuantity: askPriceQuantity,
      bidPriceQuantity: bidPriceQuantity,
      askPriceTime: askPriceTime,
      bidPriceTime: bidPriceTime,
    );
  }

  void _updateFromEntity(
    DateTime time,
    List<OrderBookAskBidEntity> list,
    Map<Decimal, DateTime> priceTime,
    Map<Decimal, Decimal> priceQuantity,
  ) {
    for (final askBidEntity in list) {
      Decimal price = askBidPrice(askBidEntity);
      if ((priceTime[price] == null) || (priceTime[price]!.isBefore(time))) {
        priceTime[price] = time;
        priceQuantity[price] = askBidQuantity(askBidEntity);
      }
    }
  }

  void _updateFromChange(
    DateTime time,
    OrderBookChangeEntity change,
    Map<Decimal, DateTime> priceTime,
    Map<Decimal, Decimal> priceQuantity,
  ) {
    Decimal price = changePrice(change);
    if ((priceTime[price] == null) || (priceTime[price]!.isBefore(time))) {
      priceTime[price] = time;
      priceQuantity[price] = changeQuantity(change);
    }
  }

  Map<DateTime, OrderBookEntity> _getTimeEntities() {
    Map<DateTime, OrderBookEntity> result = {};

    for (final entity in entities) {
      DateTime time = entity.time??DateTime.now();
      while (result[time] != null) {
        time = time.add(const Duration(microseconds: 1));
      }
      result[time] = entity;
    }

    return result;
  }

  Map<DateTime, OrderBookChangeEntity> _getTimeChanges() {
    Map<DateTime, OrderBookChangeEntity> result = {};

    for (final change in changes) {
      DateTime time = change.time??DateTime.now();
      while (result[time] != null) {
        time = time.add(const Duration(microseconds: 1));
      }
      result[time] = change;
    }

    return result;
  }
}

DateTime _maxT(DateTime a, DateTime b) {
  return (a.isAfter(b)) ? a : b;
}
