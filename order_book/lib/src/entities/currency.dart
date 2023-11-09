import 'package:json_annotation/json_annotation.dart';

part "currency.g.dart";

@JsonSerializable()
class Currency {
  List<String>? aliases;
  int? id;
  String? name;
  String? title;
  String? type;
  bool? isEnabled;
  double? serviceFee;
  double? amount;
  int? decimals;
  String? icon;

  Currency(
      {this.id,
      this.name,
      this.aliases,
      this.title,
      this.type,
      this.isEnabled,
      this.amount,
      this.serviceFee,
      this.decimals,
      this.icon});

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
