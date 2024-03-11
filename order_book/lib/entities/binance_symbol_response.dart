import 'binance_symbol_filter_response.dart';


class BiniaceSymbolResponse {
    final String symbol;
    final String status;
    final String baseAsset;
    final int baseAssetPrecision;
    final String quoteAsset;
    final int quotePrecision;
    final int quoteAssetPrecision;
    final int baseCommissionPrecision;
    final int quoteCommissionPrecision;
    final List<String> orderTypes;
    final bool icebergAllowed;
    final bool ocoAllowed;
    final bool quoteOrderQtyMarketAllowed;
    final bool allowTrailingStop;
    final bool cancelReplaceAllowed;
    final bool isSpotTradingAllowed;
    final bool isMarginTradingAllowed;
    final List<BiniaceSymbolFilterResponse> filters;
    final List<String> permissions;
    final String defaultSelfTradePreventionMode;
    final List<String> allowedSelfTradePreventionModes;

    BiniaceSymbolResponse({
        required this.symbol,
        required this.status,
        required this.baseAsset,
        required this.baseAssetPrecision,
        required this.quoteAsset,
        required this.quotePrecision,
        required this.quoteAssetPrecision,
        required this.baseCommissionPrecision,
        required this.quoteCommissionPrecision,
        required this.orderTypes,
        required this.icebergAllowed,
        required this.ocoAllowed,
        required this.quoteOrderQtyMarketAllowed,
        required this.allowTrailingStop,
        required this.cancelReplaceAllowed,
        required this.isSpotTradingAllowed,
        required this.isMarginTradingAllowed,
        required this.filters,
        required this.permissions,
        required this.defaultSelfTradePreventionMode,
        required this.allowedSelfTradePreventionModes,
    });

    factory BiniaceSymbolResponse.fromJson(Map<String, dynamic> json) => BiniaceSymbolResponse(
        symbol: json["symbol"],
        status: json["status"],
        baseAsset: json["baseAsset"],
        baseAssetPrecision: json["baseAssetPrecision"],
        quoteAsset: json["quoteAsset"],
        quotePrecision: json["quotePrecision"],
        quoteAssetPrecision: json["quoteAssetPrecision"],
        baseCommissionPrecision: json["baseCommissionPrecision"],
        quoteCommissionPrecision: json["quoteCommissionPrecision"],
        orderTypes: List<String>.from(json["orderTypes"].map((x) => x)),
        icebergAllowed: json["icebergAllowed"],
        ocoAllowed: json["ocoAllowed"],
        quoteOrderQtyMarketAllowed: json["quoteOrderQtyMarketAllowed"],
        allowTrailingStop: json["allowTrailingStop"],
        cancelReplaceAllowed: json["cancelReplaceAllowed"],
        isSpotTradingAllowed: json["isSpotTradingAllowed"],
        isMarginTradingAllowed: json["isMarginTradingAllowed"],
        filters: List<BiniaceSymbolFilterResponse>.from(json["filters"].map((x) => BiniaceSymbolFilterResponse.fromJson(x))),
        permissions: List<String>.from(json["permissions"].map((x) => x)),
        defaultSelfTradePreventionMode: json["defaultSelfTradePreventionMode"],
        allowedSelfTradePreventionModes: List<String>.from(json["allowedSelfTradePreventionModes"].map((x) => x)),
    );

    // Map<String, dynamic> toJson() => {
    //     "symbol": symbol,
    //     "status": status,
    //     "baseAsset": baseAsset,
    //     "baseAssetPrecision": baseAssetPrecision,
    //     "quoteAsset": quoteAsset,
    //     "quotePrecision": quotePrecision,
    //     "quoteAssetPrecision": quoteAssetPrecision,
    //     "baseCommissionPrecision": baseCommissionPrecision,
    //     "quoteCommissionPrecision": quoteCommissionPrecision,
    //     "orderTypes": List<dynamic>.from(orderTypes.map((x) => x)),
    //     "icebergAllowed": icebergAllowed,
    //     "ocoAllowed": ocoAllowed,
    //     "quoteOrderQtyMarketAllowed": quoteOrderQtyMarketAllowed,
    //     "allowTrailingStop": allowTrailingStop,
    //     "cancelReplaceAllowed": cancelReplaceAllowed,
    //     "isSpotTradingAllowed": isSpotTradingAllowed,
    //     "isMarginTradingAllowed": isMarginTradingAllowed,
    //     "filters": List<dynamic>.from(filters.map((x) => x.toJson())),
    //     "permissions": List<dynamic>.from(permissions.map((x) => x)),
    //     "defaultSelfTradePreventionMode": defaultSelfTradePreventionMode,
    //     "allowedSelfTradePreventionModes": List<dynamic>.from(allowedSelfTradePreventionModes.map((x) => x)),
    // };
}