
import 'package:order_book/src/entities/currency_entity.dart';
import 'package:order_book/src/entities/currency_type.dart';
import 'package:order_book/src/entities/derived_currency_list_response.dart';
import 'package:order_book/src/entities/market_response.dart';
import 'package:order_book/src/entities/markets_response.dart';

enum MarketPriceSortField { name, price, priceChange, sortId }

class MarketPriceEntity {
  int? id;
  String? name;

  CurrencyEntity? fromCurrency;
  CurrencyEntity? toCurrency;

  double? highPrice;
  double? lowPrice;
  double? price;

  double? volume;
  double? priceChange;
  double? minOrderAmount;
  double? maxOrderAmount;
  double? minOrderPrice;
  double? maxOrderPrice;
  double? sortId;

  MarketPriceEntity({
    this.id,
    this.name,
    this.fromCurrency,
    this.toCurrency,
    this.highPrice,
    this.lowPrice,
    this.price,
    this.volume,
    this.priceChange,
    this.minOrderAmount,
    this.maxOrderAmount,
    this.minOrderPrice,
    this.maxOrderPrice,
    this.sortId,
  });

  static List<MarketPriceEntity> fromResponse(MarketsResponse response) {
    
    List<MarketPriceEntity> markets = [];
    if (response.marketsList != null) {
      for (var marketResponce in response.marketsList!) {
        markets.addAll(MarketPriceEntity._fromMarketResponse(marketResponce));
      }
    }
    return markets;
  }

  static List<MarketPriceEntity> _fromMarketResponse(MarketResponse response) {
    final from = CurrencyEntity(
      type: _getCurrencyType(response.type),
      id: response.currencyId,
      name: response.currencyName,
      decimals: response.decimals,
    );

    List<MarketPriceEntity> result = [];
    if (response.derivedCurrencyList == null) return result;

    for (var derivedCurrency
        in response.derivedCurrencyList as List<DerivedCurrencyListResponse>) {
      final to = CurrencyEntity(
        type: _getCurrencyType(derivedCurrency.type),
        id: derivedCurrency.derivedCurrencyId,
        name: derivedCurrency.derivedCurrencyName,
        decimals: derivedCurrency.decimals,
      );

      result.add(MarketPriceEntity(
        id: derivedCurrency.marketId,
        name: _makeName(from, to),
        fromCurrency: from,
        toCurrency: to,
        price: derivedCurrency.price,
        priceChange: derivedCurrency.priceChange,
        highPrice: derivedCurrency.highPrice,
        volume: derivedCurrency.volume,
        lowPrice: derivedCurrency.lowPrice,
        minOrderAmount: derivedCurrency.minOrderAmount,
        maxOrderAmount: derivedCurrency.maxOrderAmount,
        minOrderPrice: derivedCurrency.minOrderPrice,
        maxOrderPrice: derivedCurrency.maxOrderPrice,
        sortId: derivedCurrency.sortId,
      ));
    }
    return result;
  }

  MarketPriceEntity copyWith({
    int? id,
    String? name,
    CurrencyEntity? fromCurrency,
    CurrencyEntity? toCurrency,
    double? highPrice,
    double? lowPrice,
    double? price,
    double? volume,
    double? priceChange,
    double? minOrderAmount,
    double? maxOrderAmount,
    double? minOrderPrice,
    double? maxOrderPrice,
    double? sortId,
  }) {
    return MarketPriceEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      highPrice: highPrice ?? this.highPrice,
      lowPrice: lowPrice ?? this.lowPrice,
      price: price ?? this.price,
      volume: volume ?? this.volume,
      priceChange: priceChange ?? this.priceChange,
      minOrderAmount: minOrderAmount ?? this.minOrderAmount,
      maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
      minOrderPrice: minOrderPrice ?? this.minOrderPrice,
      maxOrderPrice: maxOrderPrice ?? this.maxOrderPrice,
      sortId: sortId ?? this.sortId,
    );
  }

  static CurrencyType _getCurrencyType(int? type) {
    switch (type) {
      case 0:
        return CurrencyType.fiat;

      default:
        return CurrencyType.crypto;
    }
  }

  static String _makeName(
      CurrencyEntity fromCurrency, CurrencyEntity toCurrency) {
    return '${fromCurrency.name}/${toCurrency.name}';
  }
}
