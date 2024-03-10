
import 'currency.dart';
import 'derived_currency_list_response.dart';
import 'market_response.dart';
import 'markets_response.dart';

enum MarketPriceSortField { name, price, priceChange, sortId }

class MarketPriceEntity {
  int? id;
  String? name;

  Currency? fromCurrency;
  Currency? toCurrency;

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
    final from = Currency(
      id: response.currencyId,
      name: response.currencyName,
      decimals: response.decimals,
    );

    List<MarketPriceEntity> result = [];
    if (response.derivedCurrencyList == null) return result;

    for (var derivedCurrency
        in response.derivedCurrencyList as List<DerivedCurrencyListResponse>) {
      final to = Currency(
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
    Currency? fromCurrency,
    Currency? toCurrency,
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

  static String _makeName(
      Currency fromCurrency, Currency toCurrency) {
    return '${fromCurrency.name}/${toCurrency.name}';
  }
}
