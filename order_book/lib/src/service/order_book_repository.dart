import 'dart:async';

import 'package:flutter/material.dart';
import '../domain/model.dart';
import '../domain/order_book.dart';
import '../domain/order_book_view.dart';
import '../entities/currency.dart';
import '../entities/market_price_entity.dart';
import '../entities/order_book_change_entity.dart';
import '../entities/socket_responce.dart';
import 'style.dart';

class IOrderBookRepository {
  MarketPriceEntity get defaultMarket => MarketPriceEntity();
  late MarketPriceEntity market;
  late List<MarketPriceEntity> marketList;
  late List<Currency> currencyList;

  IOrderBookRepository();

  Future<void> loadSnapshot() {
    throw 'You need to override this method';
  }

  void subscribeToMarket() {
    throw 'You need to override this method';
  }

  Future<void> init({required MarketPriceEntity market}) async {
    this.market = market;
  }

  Future<void> setRound(OrderBookRound? round) async {
    if (!ready) {
      await init(market: market);
    }

    round = round;
    orderBookView = OrderBookView(orderBook, round);
    _refresh();
  }

  Future<void> setListening(bool listening) async {
    if (listening) {
      await init(market: market);
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

  OrderBook orderBook = OrderBook(OrderBookData.empty());
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

  List<OrderBookChangeEntity> parseChangeResponse(SocketResponse response) {
    throw UnimplementedError();
  }

  Future<void> socketListenerHandler(SocketResponse response) async {
    if (response.isStart) {
      await loadSnapshot();
    } else {
      final orderBookChangedEntitys = parseChangeResponse(response);


      for (var e in orderBookChangedEntitys) {
        _manageOrderBookChangedEntity(e);
      }
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

  void startLoadSnapshot() {
    _bookFreezed = true;
  }

  void finishLoadSnapshot() {
    _bookFreezed = false;
    _refresh();
  }

  handleError(r) {
    debugPrint('OrderBookRepository _handleError $r');
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
