import 'dart:async';

import 'package:decimal/decimal.dart';

import '../domain/model.dart';
import '../domain/order_book.dart';
import '../domain/order_book_entity_set.dart';
import '../domain/order_book_repository.dart';
import '../domain/order_book_view.dart';
import '/entities/market_price_entity.dart';
import '/entities/order_book_askbid_entity.dart';
import '/entities/order_book_change_entity.dart';
import '/entities/order_book_change_response.dart';
import '/entities/order_book_entity.dart';
import '/entities/socket_responce.dart';
import 'mock_exchange.dart';

import 'style.dart';

class MockRepository extends IOrderBookRepository {
  final StreamController<SocketResponse> mockStreamController =
      StreamController<SocketResponse>();
  Timer? _mockSocketTimer;
  final MockExchange _exchange;
  MockRepository() : _exchange = MockExchange() {
    socketListener = mockStreamController.stream.listen(socketListenerHandler);
    subscribeToMarket();
    controller = StreamController<OrderBookViewData>();
  }

  @override
  Future<void> init({required MarketPriceEntity market}) async {
    await super.init(market: market);
    await loadSnapshot();
    initUpdateInterfaceTimer();
    ready = true;
  }

  @override
  Future<void> loadSnapshot() async {
    startLoadSnapshot();

    late OrderBookEntitySet entitySet;
    entitySet = OrderBookEntitySet();
    entitySet.entities.add(mockData());

    entitySet.changes = List.from(changes);
    changes.clear();

    orderBook = OrderBook(entitySet.makeBookData());
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
      final deal = _exchange.getDeal(orderBook);
      final changes = _exchange.tradeDeal(orderBook, deal);
      for (var change in changes) {
        mockStreamController.add(SocketResponse(
            timestamp: DateTime.now().microsecondsSinceEpoch,
            data: change.toJson()));
      }
    });
  }

  OrderBookEntity mockData() {
    final data = OrderBookEntity(
      name: 'mock',
      asks: [
        OrderBookAskBidEntity(price: Decimal.fromInt(100), quantity: Decimal.fromInt(100)),
        OrderBookAskBidEntity(price: Decimal.fromInt(90), quantity: Decimal.fromInt(1000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(80), quantity: Decimal.fromInt(10000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(70), quantity: Decimal.fromInt(50000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(60), quantity: Decimal.fromInt(200000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(50), quantity: Decimal.fromInt(500000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(40), quantity: Decimal.fromInt(900000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(30), quantity: Decimal.fromInt(2000000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(20), quantity: Decimal.fromInt(5000000)),
      ],
      bids: [
        OrderBookAskBidEntity(price: Decimal.fromInt(100), quantity: Decimal.fromInt(100)),
        OrderBookAskBidEntity(price: Decimal.fromInt(120), quantity: Decimal.fromInt(1000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(130), quantity: Decimal.fromInt(10000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(150), quantity: Decimal.fromInt(50000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(190), quantity: Decimal.fromInt(200000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(200), quantity: Decimal.fromInt(500000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(300), quantity: Decimal.fromInt(900000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(400), quantity: Decimal.fromInt(2000000)),
        OrderBookAskBidEntity(price: Decimal.fromInt(500), quantity: Decimal.fromInt(5000000)),

      ],
      timestamp: DateTime.now().microsecondsSinceEpoch,
    );
    return data;
  }
}
