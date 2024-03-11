
import 'binance_symbol_response.dart';

class BiniaceExangeInfoResponse {
    final String timezone;
    final int serverTime;
    final List<RateLimit> rateLimits;
    final List<BiniaceSymbolResponse> symbols;

    BiniaceExangeInfoResponse({
        required this.timezone,
        required this.serverTime,
        required this.rateLimits,
        required this.symbols,
    });

    factory BiniaceExangeInfoResponse.fromJson(Map<String, dynamic> json) => BiniaceExangeInfoResponse(
        timezone: json["timezone"],
        serverTime: json["serverTime"],
        rateLimits: List<RateLimit>.from(json["rateLimits"].map((x) => RateLimit.fromJson(x))),
        symbols: List<BiniaceSymbolResponse>.from(json["symbols"].map((x) => BiniaceSymbolResponse.fromJson(x))),
    );

}

class RateLimit {
    final String rateLimitType;
    final String interval;
    final int intervalNum;
    final int limit;

    RateLimit({
        required this.rateLimitType,
        required this.interval,
        required this.intervalNum,
        required this.limit,
    });

    factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit(
        rateLimitType: json["rateLimitType"],
        interval: json["interval"],
        intervalNum: json["intervalNum"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "rateLimitType": rateLimitType,
        "interval": interval,
        "intervalNum": intervalNum,
        "limit": limit,
    };
}