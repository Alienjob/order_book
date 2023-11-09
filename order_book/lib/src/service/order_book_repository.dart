import 'dart:async';
import 'dart:convert';
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
import 'package:order_book/src/service/style.dart';


class OrderBookRepository {

  final MarketPriceEntity market;

  final TradeRepository _tradeRepository;
  final WalletSocket _walletSocket;

  bool _bookFreezed = true;
  bool _ready = false;

  Timer? _timer;
  Timer? _mockSocketTimer;

  bool _needRefresh = false;
  DateTime _lastRefresh = DateTime.now();

  final List<OrderBookChangeEntity> _changes = [];
  StreamSubscription<SocketResponse>? _socketListener;
  OrderBookRound? _round;

  late OrderBookEntitySet _entitySet;
  late OrderBook _orderBook;
  late OrderBookView _orderBookView;

  late final StreamController<OrderBookViewData> _controller;
  final Random _rand = Random();
  OrderBookRepository(
    this._tradeRepository,
    this._walletSocket, {
    required this.market,
  }) {
    _socketListener = _walletSocket.subject.listen(_socketListenerHandler);
    _subscribeToMarket();
    _controller = StreamController<OrderBookViewData>();
  }

  // интерфейс

  Stream<OrderBookViewData> get stream {
    return _controller.stream;
  }

  Future<void> init() async {
    if (market.id == -1) {
      mock();
    } else {
      await _loadSnapshot();
    }
    _initUpdateInterfaceTimer();
    _ready = true;
  }

  void _initUpdateInterfaceTimer() {
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(OrderBookStyle.updateFrequency, (timer) {
      if (_needRefresh||(_lastRefresh.add(OrderBookStyle.changedIndicationDuration).isBefore(DateTime.now()))) {
        _lastRefresh = DateTime.now();
        _controller.add(_get());
        _needRefresh = false;
      }
    });
  }

  Future<void> setRound(OrderBookRound? round) async {
    if (!_ready) {
      await init();
    }

    _round = round;
    _orderBookView = OrderBookView(_orderBook, _round);
    _refresh();
  }

  Future<void> setListening(bool listening) async {
    if (listening) {
      await init();
    } else {
      dispose();
    }
  }

  // получение среза

  void _refresh() {
    _needRefresh = true;
  }

  OrderBookViewData _get() {
    return _orderBookView.get();
  }

  // получение снапшота

  Future<void> _loadSnapshot() async {
    const limit = 1000;
    const offset = 0;
    _entitySet = OrderBookEntitySet();
    _bookFreezed = true;
    try {
      final result = await _tradeRepository.getOrderBook(
        marketId: market.id,
        limit: limit,
        offset: offset,
      );
      result.fold((response) {
        _entitySet.entities.add(response);
      }, (error) {
        _handleError(error);
      });
    } catch (e) {
      _handleError(e);
    }

    _entitySet.changes = List.from(_changes);
    _changes.clear();

    _orderBook = OrderBook(_entitySet.makeBookData());
    _orderBookView = OrderBookView(_orderBook, _round);
    _bookFreezed = false;
    _refresh();
  }

  // обработка получения изменения маркета через сокет

  void _subscribeToMarket() {
    Map<String, int> data = {"marketId": market.id!};
    _walletSocket.send(jsonEncode(data));
  }

  Future<void> _socketListenerHandler(SocketResponse response) async {
    if (response.responseType == "OrderBook") {
      if (response.isStart) {
        await _loadSnapshot();
      } else {
        final orderBookChangeResponse =
            OrderBookChangeResponse.fromJson(response.data!);
        final orderBookChangedEntity = OrderBookChangeEntity.fromResponse(
          response: orderBookChangeResponse,
          time: response.time,
          timestamp: response.timestamp,
        );

        // данные другого маркета игнорируем
        if (orderBookChangedEntity.marketId != market.id) return;

        _manageOrderBookChangedEntity(orderBookChangedEntity);
      }
    }
  }

  void _manageOrderBookChangedEntity(OrderBookChangeEntity change) {
    if (_bookFreezed) {
      //проиходит получение снапшота.
      //Сообщения из сокета складываем в специальную очередь
      _changes.add(change);
      return;
    }

    // поток свободен, обрабатываем изменение
    _processOrderBookChangedEntity(change);
  }

  _processOrderBookChangedEntity(OrderBookChangeEntity change) {
    _orderBookView.update(change);
    _refresh();
  }

  // прочее

  _handleError(r) {
    print('OrderBookRepository _handleError $r');
  }

  dispose() {
    _socketListener?.cancel();
    _socketListener = null;

    _timer?.cancel();
    _timer = null;

    _mockSocketTimer?.cancel();
    _mockSocketTimer = null;
  }

  mock() {
    _entitySet = OrderBookEntitySet();
    _entitySet.entities.add(mock_data());
    _orderBook = OrderBook(_entitySet.makeBookData());
    _orderBookView = OrderBookView(_orderBook, _round);
    _bookFreezed = false;

    _mockSocketTimer?.cancel();
    _mockSocketTimer = null;

    _mockSocketTimer = Timer.periodic(OrderBookStyle.mockGenerateFrequency, (timer) {
      _manageOrderBookChangedEntity(_randomChange());
    });
  }

  OrderBookChangeEntity _randomChange() {
    bool sideAsks = _rand.nextBool();
    final list = sideAsks
        ? _orderBook.data.askPriceQuantity
        : _orderBook.data.bidPriceQuantity;
    final isNewPrice = (_rand.nextInt(30) >= list.length);
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
      final isDelete = (_rand.nextInt(20) <= list.length - OrderBookStyle.mockDeleteLimit);
      final isDeleteFirst = _rand.nextBool();
      price = list.keys.toList()[_rand.nextInt(list.keys.length - 1)];
      if (isDelete&&isDeleteFirst) {
        price = list.keys.reduce((a, b) => (sideAsks)?((a<b)?a:b):((a<b)?b:a));
      }
      quantity = isDelete ? Decimal.zero : (list[price]! * delta + price);
    }

    return OrderBookChangeEntity(
        marketId: -1,
        price: price.round(scale: 2),
        amount: quantity.round(scale: 5),
        side: sideAsks ? BuySell.sell : BuySell.buy,
        count: 1,
        time: DateTime.now());
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
      time: DateTime.now(),
    );
    return data;
  }
}
