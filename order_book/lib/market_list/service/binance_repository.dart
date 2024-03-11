
import 'dart:async';

import '../../api/binance_api.dart';
import '../domain/market_list_repository.dart';
import '/entities/binance_exchange_info_response.dart';
import '/entities/currency.dart';
import '/entities/market_price_entity.dart';

class BinanceMarketListRepository extends IMarketListRepository {

  final BinanceApi api = BinanceApi();
  BiniaceExangeInfoResponse? exchangeInfo;

  @override
  Future<void> init() async {
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

    ready = true;
  }

}
