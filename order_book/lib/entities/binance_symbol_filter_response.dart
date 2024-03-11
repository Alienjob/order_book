sealed class BiniaceSymbolFilterResponse {
  static BiniaceSymbolFilterResponse fromJson(Map<String, dynamic> json) {
    return switch (json['filterType']) {
      (BiniaceSymbolFilterPriceResponse.filterType) =>
        BiniaceSymbolFilterPriceResponse.fromJson(json),
      (BiniaceSymbolFilterLotSizeResponse.filterType) =>
        BiniaceSymbolFilterLotSizeResponse.fromJson(json),
      (BiniaceSymbolFilterIcebergPartsResponse.filterType) =>
        BiniaceSymbolFilterIcebergPartsResponse.fromJson(json),
      (BiniaceSymbolFilterMarketLotSizeResponse.filterType) =>
        BiniaceSymbolFilterMarketLotSizeResponse.fromJson(json),
      (BiniaceSymbolFilterTrailingDeltaResponse.filterType) =>
        BiniaceSymbolFilterTrailingDeltaResponse.fromJson(json),
      (BiniaceSymbolFilterPercentPriceBySideResponse.filterType) =>
        BiniaceSymbolFilterPercentPriceBySideResponse.fromJson(json),
      (BiniaceSymbolFilterNotionalResponse.filterType) =>
        BiniaceSymbolFilterNotionalResponse.fromJson(json),
      (BiniaceSymbolFilterMaxNumOrdersResponse.filterType) =>
        BiniaceSymbolFilterMaxNumOrdersResponse.fromJson(json),
      (BiniaceSymbolFilterMaxNumAlgoOrdersResponse.filterType) =>
        BiniaceSymbolFilterMaxNumAlgoOrdersResponse.fromJson(json),
      (BiniaceSymbolFilterMaxPositionResponse.filterType) =>
        BiniaceSymbolFilterMaxPositionResponse.fromJson(json),
      _ => throw 'BiniaceSymbolFilterResponse unexpected filer type'
    };
  }
}

class BiniaceSymbolFilterPriceResponse extends BiniaceSymbolFilterResponse {
  static const filterType = 'PRICE_FILTER';

  final String minPrice;
  final String maxPrice;
  final String tickSize;

  BiniaceSymbolFilterPriceResponse({
    required this.minPrice,
    required this.maxPrice,
    required this.tickSize,
  });

  static BiniaceSymbolFilterPriceResponse fromJson(Map<String, dynamic> json) =>
      BiniaceSymbolFilterPriceResponse(
        minPrice: json["minPrice"],
        maxPrice: json["maxPrice"],
        tickSize: json["tickSize"],
      );
}

class BiniaceSymbolFilterLotSizeResponse extends BiniaceSymbolFilterResponse {
  static const filterType = 'LOT_SIZE';

  final String minQty;
  final String maxQty;
  final String stepSize;

  BiniaceSymbolFilterLotSizeResponse({
    required this.minQty,
    required this.maxQty,
    required this.stepSize,
  });

  factory BiniaceSymbolFilterLotSizeResponse.fromJson(
          Map<String, dynamic> json) =>
      BiniaceSymbolFilterLotSizeResponse(
        minQty: json["minQty"],
        maxQty: json["maxQty"],
        stepSize: json["stepSize"],
      );
}

class BiniaceSymbolFilterIcebergPartsResponse
    extends BiniaceSymbolFilterResponse {
  static const filterType = 'ICEBERG_PARTS';

  final int limit;

  BiniaceSymbolFilterIcebergPartsResponse({
    required this.limit,
  });

  factory BiniaceSymbolFilterIcebergPartsResponse.fromJson(
          Map<String, dynamic> json) =>
      BiniaceSymbolFilterIcebergPartsResponse(
        limit: json["limit"],
      );
}

class BiniaceSymbolFilterMarketLotSizeResponse
    extends BiniaceSymbolFilterResponse {
  static const filterType = 'MARKET_LOT_SIZE';

  final String minQty;
  final String maxQty;
  final String stepSize;

  BiniaceSymbolFilterMarketLotSizeResponse({
    required this.minQty,
    required this.maxQty,
    required this.stepSize,
  });

  factory BiniaceSymbolFilterMarketLotSizeResponse.fromJson(
          Map<String, dynamic> json) =>
      BiniaceSymbolFilterMarketLotSizeResponse(
        minQty: json["minQty"],
        maxQty: json["maxQty"],
        stepSize: json["stepSize"],
      );
}

class BiniaceSymbolFilterTrailingDeltaResponse
    extends BiniaceSymbolFilterResponse {
  static const filterType = 'TRAILING_DELTA';

  final int minTrailingAboveDelta;
  final int maxTrailingAboveDelta;
  final int minTrailingBelowDelta;
  final int maxTrailingBelowDelta;

  BiniaceSymbolFilterTrailingDeltaResponse({
    required this.minTrailingAboveDelta,
    required this.maxTrailingAboveDelta,
    required this.minTrailingBelowDelta,
    required this.maxTrailingBelowDelta,
  });

  factory BiniaceSymbolFilterTrailingDeltaResponse.fromJson(
          Map<String, dynamic> json) =>
      BiniaceSymbolFilterTrailingDeltaResponse(
        minTrailingAboveDelta: json["minTrailingAboveDelta"],
        maxTrailingAboveDelta: json["maxTrailingAboveDelta"],
        minTrailingBelowDelta: json["minTrailingBelowDelta"],
        maxTrailingBelowDelta: json["maxTrailingBelowDelta"],
      );
}

class BiniaceSymbolFilterPercentPriceBySideResponse
    extends BiniaceSymbolFilterResponse {
  static const filterType = 'PERCENT_PRICE_BY_SIDE';

  final String bidMultiplierUp;
  final String bidMultiplierDown;
  final String askMultiplierUp;
  final String askMultiplierDown;
  final int avgPriceMins;

  BiniaceSymbolFilterPercentPriceBySideResponse({
    required this.bidMultiplierUp,
    required this.bidMultiplierDown,
    required this.askMultiplierUp,
    required this.askMultiplierDown,
    required this.avgPriceMins,
  });

  factory BiniaceSymbolFilterPercentPriceBySideResponse.fromJson(
          Map<String, dynamic> json) =>
      BiniaceSymbolFilterPercentPriceBySideResponse(
        bidMultiplierUp: json["bidMultiplierUp"],
        bidMultiplierDown: json["bidMultiplierDown"],
        askMultiplierUp: json["askMultiplierUp"],
        askMultiplierDown: json["askMultiplierDown"],
        avgPriceMins: json["avgPriceMins"],
      );
}

class BiniaceSymbolFilterNotionalResponse extends BiniaceSymbolFilterResponse {
  static const filterType = 'NOTIONAL';

  final String minNotional;
  final bool applyMinToMarket;
  final String maxNotional;
  final bool applyMaxToMarket;
  final int avgPriceMins;

  BiniaceSymbolFilterNotionalResponse({
    required this.minNotional,
    required this.applyMinToMarket,
    required this.maxNotional,
    required this.applyMaxToMarket,
    required this.avgPriceMins,
  });

  factory BiniaceSymbolFilterNotionalResponse.fromJson(
          Map<String, dynamic> json) =>
      BiniaceSymbolFilterNotionalResponse(
        minNotional: json["minNotional"],
        applyMinToMarket: json["applyMinToMarket"],
        maxNotional: json["maxNotional"],
        applyMaxToMarket: json["applyMaxToMarket"],
        avgPriceMins: json["avgPriceMins"],
      );
}

class BiniaceSymbolFilterMaxNumOrdersResponse
    extends BiniaceSymbolFilterResponse {
  static const filterType = 'MAX_NUM_ORDERS';

  final int maxNumOrders;

  BiniaceSymbolFilterMaxNumOrdersResponse({
    required this.maxNumOrders,
  });

  factory BiniaceSymbolFilterMaxNumOrdersResponse.fromJson(
          Map<String, dynamic> json) =>
      BiniaceSymbolFilterMaxNumOrdersResponse(
        maxNumOrders: json["maxNumOrders"],
      );
}

class BiniaceSymbolFilterMaxNumAlgoOrdersResponse
    extends BiniaceSymbolFilterResponse {
  static const filterType = 'MAX_NUM_ALGO_ORDERS';

  final int maxNumAlgoOrders;

  BiniaceSymbolFilterMaxNumAlgoOrdersResponse({
    required this.maxNumAlgoOrders,
  });

  factory BiniaceSymbolFilterMaxNumAlgoOrdersResponse.fromJson(
          Map<String, dynamic> json) =>
      BiniaceSymbolFilterMaxNumAlgoOrdersResponse(
        maxNumAlgoOrders: json["maxNumAlgoOrders"],
      );
}

class BiniaceSymbolFilterMaxPositionResponse
    extends BiniaceSymbolFilterResponse {
  static const filterType = 'MAX_POSITION';

  final double maxPosition;

  BiniaceSymbolFilterMaxPositionResponse({
    required this.maxPosition,
  });

  factory BiniaceSymbolFilterMaxPositionResponse.fromJson(
          Map<String, dynamic> json) =>
      BiniaceSymbolFilterMaxPositionResponse(
        maxPosition: double.parse(json["maxPosition"]) ,
      );
}
