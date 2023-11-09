import 'package:decimal/decimal.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/domain/order_book.dart';
import 'package:order_book/src/entities/buy_sell.dart';
import 'package:order_book/src/entities/order_book_change_entity.dart';

class OrderBookView {
  final OrderBook orderBook;
  final OrderBookRound? round;

  late OrderBookData viewData;

  double? _previousPrice;
  double? _priceChange;

  OrderBookView(this.orderBook, this.round) {
    DateTime timeStamp = orderBook.data.timeStamp;

    Map<Decimal, Decimal> askPriceQuantity = {};
    Map<Decimal, Decimal> bidPriceQuantity = {};
    Map<Decimal, DateTime> askPriceTime = {};
    Map<Decimal, DateTime> bidPriceTime = {};

    for (final price in orderBook.data.askPriceQuantity.keys) {
      final rounded = _doRound(price);
      final quantity = orderBook.data.askPriceQuantity[price] ?? Decimal.zero;
      askPriceQuantity[rounded] =
          (askPriceQuantity[rounded] ?? Decimal.zero) + quantity;
      askPriceTime[rounded] = timeStamp;
    }
    for (final price in orderBook.data.bidPriceQuantity.keys) {
      final rounded = _doRound(price);
      final quantity = orderBook.data.bidPriceQuantity[price] ?? Decimal.zero;
      bidPriceQuantity[rounded] =
          (bidPriceQuantity[rounded] ?? Decimal.zero) + quantity;
      bidPriceTime[rounded] = timeStamp;
    }

    viewData = OrderBookData(
        timeStamp: timeStamp,
        askPriceTime: askPriceTime,
        bidPriceTime: bidPriceTime,
        askPriceQuantity: askPriceQuantity,
        bidPriceQuantity: bidPriceQuantity);
  }

  void update(OrderBookChangeEntity change) {
    final delta = orderBook.update(change);

    if (delta.abs() > Decimal.zero) {
      final price = changePrice(change);
      final rounded = _doRound(price);
      final store = (change.side == BuySell.buy)
          ? viewData.bidPriceQuantity
          : viewData.askPriceQuantity;
      final changeStore = (change.side == BuySell.buy)
          ? viewData.bidPriceTime
          : viewData.askPriceTime;
      store[rounded] = (store[rounded] ?? Decimal.zero) + delta;
      changeStore[rounded] = change.time ?? DateTime.now();

      if (store[rounded] == Decimal.zero) store.remove(rounded);
    }
  }

  Decimal _doRound(Decimal price) {
    if (round == null) return price;
    Decimal step = round!.getStep();
    final result = Decimal.fromBigInt((price / step).round()) * step;
    return result;
  }

  OrderBookViewData get() {
    List<OrderBookTileData> asks = viewData.askPriceQuantity.keys
        .map((key) => OrderBookTileData(
              price: key.toDouble(),
              quantity: viewData.askPriceQuantity[key]?.toDouble() ?? 0,
              total: (key.toDouble()) *
                  (viewData.askPriceQuantity[key]?.toDouble() ?? 0),
              updateTime: viewData.askPriceTime[key]!,
            ))
        .toList();
    List<OrderBookTileData> bids = viewData.bidPriceQuantity.keys
        .map((key) => OrderBookTileData(
              price: key.toDouble(),
              quantity: viewData.bidPriceQuantity[key]?.toDouble() ?? 0,
              total: (key.toDouble()) *
                  (viewData.bidPriceQuantity[key]?.toDouble() ?? 0),
              updateTime: viewData.bidPriceTime[key]!,
            ))
        .toList();

    asks.sort((a, b) => a.price.compareTo(b.price));
    bids.sort((a, b) => b.price.compareTo(a.price));

    double currentPrice = (bids.isNotEmpty) ? bids.first.price : 0;
    if (currentPrice != _previousPrice) {
      _priceChange =
          (_previousPrice == null) ? 0 : (currentPrice - _previousPrice!);
      _previousPrice = currentPrice;
    }

    final result = OrderBookViewData(
      asks: asks,
      bids: bids,
      currentPrice: currentPrice,
      currentPriceChange: _priceChange ?? 0,
    );

    return result;
  }
}
