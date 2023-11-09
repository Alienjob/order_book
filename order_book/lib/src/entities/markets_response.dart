import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:order_book/src/entities/market_response.dart';

part "markets_response.g.dart";

@JsonSerializable()
class MarketsResponse {
  List<MarketResponse>? marketsList;
  double? total;
  List<int>? availableTypes;

  MarketsResponse({
    this.marketsList,
    this.total,
    this.availableTypes,
  });
  factory MarketsResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketsResponseToJson(this);
}
