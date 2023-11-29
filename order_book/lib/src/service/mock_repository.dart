import 'dart:async';
import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/domain/order_book.dart';
import 'package:order_book/src/domain/order_book_entity_set.dart';
import 'package:order_book/src/domain/order_book_view.dart';
import 'package:order_book/src/entities/buy_sell.dart';
import 'package:order_book/src/entities/market_price_entity.dart';
import 'package:order_book/src/entities/order_book_change_entity.dart';
import 'package:order_book/src/entities/order_book_change_response.dart';
import 'package:order_book/src/entities/order_book_entity.dart';
import 'package:order_book/src/entities/socket_responce.dart';
import 'package:order_book/src/service/order_book_repository.dart';
import 'package:order_book/src/service/style.dart';

class MockRepository extends IOrderBookRepository {
  final Random _rand = Random();
  final StreamController<SocketResponse> mockStreamController =
      StreamController<SocketResponse>();
  Timer? _mockSocketTimer;

  MockRepository() {
    socketListener = mockStreamController.stream.listen(socketListenerHandler);
    subscribeToMarket();
    controller = StreamController<OrderBookViewData>();
  }

  @override
  Future<void> init() async {
    await loadSnapshot();
    initUpdateInterfaceTimer();
    ready = true;
  }

  @override
  Future<void> loadSnapshot() async {
    startLoadSnapshot();

    late OrderBookEntitySet _entitySet;
    _entitySet = OrderBookEntitySet();
    _entitySet.entities.add(mock_data());

    _entitySet.changes = List.from(changes);
    changes.clear();

    orderBook = OrderBook(_entitySet.makeBookData());
    orderBookView = OrderBookView(orderBook, round);

    finishLoadSnapshot();
  }

  @override
  List<OrderBookChangeEntity> parseChangeResponse(SocketResponse response) {
    return [
      OrderBookChangeEntity.fromResponse(
        response: OrderBookChangeResponse.fromJson(response.data!),
        timestamp: response.timestamp,
      )
    ];
  }

  @override
  void subscribeToMarket() {
    _mockSocketTimer?.cancel();
    _mockSocketTimer = null;

    _mockSocketTimer =
        Timer.periodic(OrderBookStyle.mockGenerateFrequency, (timer) {
      mockStreamController.add(SocketResponse(
          timestamp: DateTime.now().millisecondsSinceEpoch,
          data: _randomChange().toJson()));
    });
  }

  OrderBookChangeEntity _randomChange() {
    bool sideAsks = _rand.nextBool();
    final list = sideAsks
        ? orderBook.data.askPriceQuantity
        : orderBook.data.bidPriceQuantity;
    final isNewPrice = (_rand.nextInt(100) >= list.length);
    Decimal price;
    late final Decimal quantity;
    final Decimal delta =
        _rand.nextBool() ? Decimal.parse('1.11') : Decimal.parse('0.88');
    if (isNewPrice) {
      price = (list.isEmpty)
          ? (Decimal.fromInt(_rand.nextInt(5)))
          : (_randomPriceFromMap(list) * delta);
      quantity = price;
    } else {
      final isDelete =
          (_rand.nextInt(20) <= list.length - OrderBookStyle.mockDeleteLimit);
      final isDeleteFirst = _rand.nextBool();
      if (list.isNotEmpty) {
        price = list.keys.toList()[_rand.nextInt(list.keys.length)];
      } else {
        price = Decimal.fromInt(_rand.nextInt(5));
      }
      if (isDelete && isDeleteFirst) {
        price = list.keys.reduce(
            (a, b) => (sideAsks) ? ((a < b) ? a : b) : ((a < b) ? b : a));
      }
      quantity = isDelete ? Decimal.zero : (list[price]! * delta + price);
    }

    return OrderBookChangeEntity(
        marketId: -1,
        price: price.round(scale: 2),
        amount: quantity.round(scale: 5),
        side: sideAsks ? BuySell.sell : BuySell.buy,
        count: 1,
        timestamp: DateTime.now().microsecondsSinceEpoch);
  }

  Decimal _randomPriceFromMap(Map<Decimal, Decimal> list) {
    if (list.keys.length == 1) return list.keys.first;
    return list.keys.toList()[_rand.nextInt(list.keys.length - 1)];
  }

  OrderBookEntity mock_data() {
    final data = OrderBookEntity(
      name: 'mock',
      asks: [],
      bids: [],
      timestamp: DateTime.now().microsecondsSinceEpoch,
    );
    return data;
  }
}
