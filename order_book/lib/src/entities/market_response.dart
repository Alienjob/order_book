import 'package:json_annotation/json_annotation.dart';
import 'package:order_book/src/entities/derived_currency_list_response.dart';

part "market_response.g.dart";

@JsonSerializable()
class MarketResponse {
  int? currencyId;
  int? type;
  int? decimals;
  String? currencyName;

  List<DerivedCurrencyListResponse>? derivedCurrencyList;

  MarketResponse({
    this.currencyId,
    this.type,
    this.decimals,
    this.currencyName,
    this.derivedCurrencyList,
  });
  factory MarketResponse.fromJson(Map<String, dynamic> json) => _$MarketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketResponseToJson(this);
}
