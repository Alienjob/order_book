
import 'dart:async';
import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/domain/order_book.dart';
import 'package:order_book/src/domain/order_book_entity_set.dart';
import 'package:order_book/src/domain/order_book_view.dart';
import 'package:order_book/src/entities/binance_change_depth_response.dart';
import 'package:order_book/src/entities/buy_sell.dart';
import 'package:order_book/src/entities/market_price_entity.dart';
import 'package:order_book/src/entities/order_book_change_entity.dart';
import 'package:order_book/src/entities/order_book_change_response.dart';
import 'package:order_book/src/entities/socket_responce.dart';
import 'package:order_book/src/service/binance_api.dart';
import 'package:order_book/src/service/order_book_repository.dart';

const _symbol = 'bnbbtc';
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

    late OrderBookEntitySet _entitySet;
    _entitySet = OrderBookEntitySet();

    try {
      final result = await api.getOrderBook(
        symbol: _symbol,

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
    api.openDepth(symbol: _symbol);
  }

  @override
  MarketPriceEntity get defaultMarket => MarketPriceEntity(
      id: 1,
      name: 'ETHBTC',
    );

  @override
  List<OrderBookChangeEntity> parseChangeResponse(SocketResponse response){
    final changeResponse = BiniaceChangeDepthResponse.fromJson(response.data!);
    final result = <OrderBookChangeEntity>[];
    for (var ask in changeResponse.a){
      result.add(
        OrderBookChangeEntity(
          price: Decimal.parse(ask[0]),
          amount: Decimal.parse(ask[1]),
          side: BuySell.sell,
          timestamp: changeResponse.U
        )
      );
    }
        for (var bid in changeResponse.b){
      result.add(
        OrderBookChangeEntity(
          price: Decimal.parse(bid[0]),
          amount: Decimal.parse(bid[1]),
          side: BuySell.buy,
          timestamp: changeResponse.U
        )
      );
    }
    return result;
  }
}
