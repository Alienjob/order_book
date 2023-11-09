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
import 'package:order_book/src/entities/socket_responce.dart';
import 'package:order_book/src/service/style.dart';



class IOrderBookRepository {
  final MarketPriceEntity market;

  IOrderBookRepository({required this.market});

  Future<void> loadSnapshot() {
    throw 'You need to override this method';
  }

  void subscribeToMarket() {
    throw 'You need to override this method';
  }

  Future<void> init() {
    throw 'You need to override this method';
  }

  Future<void> setRound(OrderBookRound? round) async {
    if (!ready) {
      await init();
    }

    round = round;
    orderBookView = OrderBookView(orderBook, round);
    _refresh();
  }

  Future<void> setListening(bool listening) async {
    if (listening) {
      await init();
    } else {
      dispose();
    }
  }

  Stream<OrderBookViewData> get stream {
    return controller.stream;
  }

  bool _bookFreezed = true;
  bool ready = false;
  Timer? _timer;
  bool _needRefresh = false;
  DateTime _lastRefresh = DateTime.now();

  final List<OrderBookChangeEntity> changes = [];

  OrderBookRound? round;


  late OrderBook orderBook;
  late OrderBookView orderBookView;

  StreamSubscription<SocketResponse>? socketListener;
  late final StreamController<OrderBookViewData> controller;

  void initUpdateInterfaceTimer() {
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(OrderBookStyle.updateFrequency, (timer) {
      if (_needRefresh ||
          (_lastRefresh
              .add(OrderBookStyle.changedIndicationDuration)
              .isBefore(DateTime.now()))) {
        _lastRefresh = DateTime.now();
        controller.add(_get());
        _needRefresh = false;
      }
    });
  }

  Future<void> socketListenerHandler(SocketResponse response) async {
    if (response.isStart) {
      await loadSnapshot();
    } else {
      final orderBookChangeResponse =
          OrderBookChangeResponse.fromJson(response.data!);
      final orderBookChangedEntity = OrderBookChangeEntity.fromResponse(
        response: orderBookChangeResponse,
        time: response.time,
        timestamp: response.timestamp,
      );

      _manageOrderBookChangedEntity(orderBookChangedEntity);
    }
  }

  void _manageOrderBookChangedEntity(OrderBookChangeEntity change) {
    if (_bookFreezed) {
      //проиходит получение снапшота.
      //Сообщения из сокета складываем в специальную очередь
      changes.add(change);
      return;
    }

    // поток свободен, обрабатываем изменение
    _processOrderBookChangedEntity(change);
  }

  _processOrderBookChangedEntity(OrderBookChangeEntity change) {
    orderBookView.update(change);
    _refresh();
  }

  // прочее

  void startLoadSnapshot(){
    _bookFreezed = true;
  }
  void finishLoadSnapshot(){
    _bookFreezed = false;
    _refresh();
  }

  handleError(r) {
    print('OrderBookRepository _handleError $r');
  }

  dispose() {
    socketListener?.cancel();
    socketListener = null;

    _timer?.cancel();
    _timer = null;
  }

  void _refresh() {
    _needRefresh = true;
  }

  OrderBookViewData _get() {
    return orderBookView.get();
  }
}

