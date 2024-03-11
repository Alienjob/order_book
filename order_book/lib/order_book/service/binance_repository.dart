
import 'dart:async';

import 'package:decimal/decimal.dart';
import '../../api/binance_api.dart';
import '../domain/model.dart';
import '../domain/order_book.dart';
import '../domain/order_book_entity_set.dart';
import '../domain/order_book_repository.dart';
import '../domain/order_book_view.dart';
import '/entities/binance_change_depth_response.dart';
import '/entities/binance_exchange_info_response.dart';
import '/entities/buy_sell.dart';
import '/entities/currency.dart';
import '/entities/market_price_entity.dart';
import '/entities/order_book_change_entity.dart';
import '/entities/socket_responce.dart';

class BinanceRepository extends IOrderBookRepository {

  final BinanceApi api = BinanceApi();
  BiniaceExangeInfoResponse? exchangeInfo;
  BinanceRepository() {
    socketListener = api.subject.listen(socketListenerHandler);
    controller = StreamController<OrderBookViewData>();

  }

  @override
  Future<void> init({required MarketPriceEntity market}) async {
    await super.init(market: market);
    subscribeToMarket();
    exchangeInfo ??= await api.getExchangeInfo();
    
    marketList = exchangeInfo!.symbols.map((e) => MarketPriceEntity(
      id: e.symbol.hashCode,
      name: e.symbol,
      fromCurrency: Currency(
        id: e.baseAsset.hashCode,
        name: e.baseAsset,
      ),
      toCurrency: Currency(
        id: e.quoteAsset.hashCode,
        name: e.quoteAsset,
      ),

      
    )).toList();

    await loadSnapshot();
    initUpdateInterfaceTimer();
    ready = true;
  }

  @override
  Future<void> loadSnapshot() async {
    startLoadSnapshot();
  
    late OrderBookEntitySet entitySet;
    entitySet = OrderBookEntitySet();

    try {
      final result = await api.getOrderBook(
        symbol: (super.market.name)!,

      );
      result.fold((response) {
        entitySet.entities.add(response);
      }, (error) {
        handleError(error);
      });
    } catch (e) {
      handleError(e);
    }
    entitySet.changes = List.from(changes);
    changes.clear();

    orderBook = OrderBook(entitySet.makeBookData());
    orderBookView = OrderBookView(orderBook, round);

    finishLoadSnapshot();

  }

  @override
  void subscribeToMarket() {
    api.openDepth(symbol: (super.market.name)!);
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
