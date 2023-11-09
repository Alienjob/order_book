import 'package:json_annotation/json_annotation.dart';
import 'package:order_book/src/entities/derived_currency_list_response.dart';


part "market_price_changed_response.g.dart";

// {"type":"MarketPrice","data":{"marketId":14,"price":1663.38},"time":"2023-06-14 20:38:08Z","timestamp":1686775088402,"id":3}

@JsonSerializable()
class MarketPriceChangedResponse {
  String? type;
  MarketPriceDataResponse? data;
  String? time;
  int? timestamp;
  int? id;

  List<DerivedCurrencyListResponse>? derivedCurrencyList;

  MarketPriceChangedResponse({
    this.type,
    this.data,
    this.time,
    this.derivedCurrencyList,
    this.id,
  });
  factory MarketPriceChangedResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketPriceChangedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketPriceChangedResponseToJson(this);
}

@JsonSerializable()
class MarketPriceDataResponse {
  int? marketId;
  double? price;

  MarketPriceDataResponse({
    this.marketId,
    this.price,
  });
  factory MarketPriceDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketPriceDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketPriceDataResponseToJson(this);
}

