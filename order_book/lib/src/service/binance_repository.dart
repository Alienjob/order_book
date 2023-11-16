
import 'dart:async';
import 'dart:convert';

import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/domain/order_book.dart';
import 'package:order_book/src/domain/order_book_entity_set.dart';
import 'package:order_book/src/domain/order_book_view.dart';
import 'package:order_book/src/service/binance_api.dart';
import 'package:order_book/src/service/order_book_repository.dart';

class BinanceRepository extends IOrderBookRepository {

  final BinanceApi api = BinanceApi();

  BinanceRepository() {
    socketListener = api.subject.listen(socketListenerHandler);
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

    const limit = 1000;
    const offset = 0;
    late OrderBookEntitySet _entitySet;
    _entitySet = OrderBookEntitySet();

    try {
      final result = await api.getOrderBook(
        marketId: market?.id??0,
        limit: limit,
        offset: offset,
      );
      result.fold((response) {
        _entitySet.entities.add(response);
      }, (error) {
        handleError(error);
      });
    } catch (e) {
      handleError(e);
    }

    _entitySet.changes = List.from(changes);
    changes.clear();

    orderBook = OrderBook(_entitySet.makeBookData());
    orderBookView = OrderBookView(orderBook, round);


    finishLoadSnapshot();
  }

  @override
  void subscribeToMarket() {
    Map<String, int> data = {"marketId": market?.id??0};
    api.send(jsonEncode(data));
  }
}
