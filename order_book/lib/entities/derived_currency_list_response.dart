import 'package:json_annotation/json_annotation.dart';

part "derived_currency_list_response.g.dart";

@JsonSerializable()
class DerivedCurrencyListResponse {
  int? marketId;
  int? derivedCurrencyId;
  int? type;
  int? decimals;
  String? derivedCurrencyName;

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

  DerivedCurrencyListResponse({
    this.marketId,
    this.derivedCurrencyId,
    this.type,
    this.decimals,
    this.derivedCurrencyName,
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
  factory DerivedCurrencyListResponse.fromJson(Map<String, dynamic> json) =>
      _$DerivedCurrencyListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DerivedCurrencyListResponseToJson(this);
}
