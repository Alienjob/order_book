import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:order_book/src/domain/order_book.dart';
import 'package:order_book/src/entities/buy_sell.dart';
import 'package:order_book/src/entities/order_book_change_entity.dart';

class MockExchange {
  final Random _rand = Random();

  OrderBookChangeEntity getDeal(OrderBook orderBook) {
    bool sideAsks = _rand.nextBool();
    final list = !sideAsks
        ? orderBook.data.askPriceQuantity
        : orderBook.data.bidPriceQuantity;
    final amount = _rand.nextInt(10000);
    final actualPrice =
        (list.isEmpty) ? 100 : (list.keys.toList()[0]).toDouble();
    final limitPrice =
        actualPrice * (1 + _rand.nextDouble() * (sideAsks ? (-1) : 1));

    return OrderBookChangeEntity(
        marketId: -1,
        price: Decimal.parse('$limitPrice').round(scale: 2),
        amount: Decimal.fromInt(amount),
        side: sideAsks ? BuySell.sell : BuySell.buy,
        count: 1,
        timestamp: DateTime.now().microsecondsSinceEpoch);
  }

  List<OrderBookChangeEntity> tradeDeal(
      OrderBook orderBook, OrderBookChangeEntity deal) {
    final result = <OrderBookChangeEntity>[];
    final listTrade = (deal.side == BuySell.sell)
        ? orderBook.data.askPriceQuantity
        : orderBook.data.bidPriceQuantity;
    Decimal amount = deal.amount ?? Decimal.zero;

    final canDeal = listTrade.entries
        .where((MapEntry<Decimal, Decimal> e) => deal.side == BuySell.sell
            ? (e.key >= deal.price!)
            : (e.key <= deal.price!))
        .toList()
      ..sort((e1, e2) =>
          (deal.side == BuySell.buy ? (e1.key - e2.key) : (e2.key - e1.key))
              .toDouble()
              .round());
    for (var source in canDeal) {
      final change = _tradeEntity(source, deal, amount);
      final consumed = source.value - change.amount!;
      amount = amount - consumed;
      result.add(change);

      if (amount == Decimal.zero) break;
    }
    if (amount > Decimal.zero) {
      result.add(deal.copyWith(amount: amount, side: deal.side?.opposite));
    }

    return result;
  }

  OrderBookChangeEntity _tradeEntity(MapEntry<Decimal, Decimal> priceAmount,
      OrderBookChangeEntity change, Decimal amount) {
    if (change.price! >= priceAmount.key) {
      return change.copyWith(
        side: BuySell.buy,
        price: priceAmount.key,
        amount: decimalMax(Decimal.zero, priceAmount.value - amount),
      );
    } else {
      return change.copyWith(
        side: BuySell.sell,
        price: priceAmount.key,
        amount: decimalMax(Decimal.zero, priceAmount.value - amount),
      );
    }
  }
}

Decimal decimalMax(Decimal v1, Decimal v2) {
  return (v1 > v2) ? v1 : v2;
}
