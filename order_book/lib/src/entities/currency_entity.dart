
import 'package:order_book/src/entities/currency.dart';
import 'package:order_book/src/entities/currency_type.dart';

class CurrencyEntity {
  List<String>? aliases;
  int? id;
  String? name;
  String? title;
  CurrencyType type;
  bool? isEnabled;
  double? serviceFee;
  double? amount;
  int? decimals;
  String? icon;

  CurrencyEntity(
      {this.id,
      this.name,
      this.title,
      this.amount,
      required this.type,
      this.isEnabled,
      this.serviceFee,
      this.decimals,
      this.aliases,
      this.icon});

  factory CurrencyEntity.fromResponse(Currency response) => CurrencyEntity(
        aliases: response.aliases,
        id: response.id,
        name: response.name,
        title: response.title,
        type: _getCurrencyType(response.type!),
        isEnabled: response.isEnabled,
        serviceFee: response.serviceFee,
        decimals: response.decimals,
        icon: response.icon,
        amount: response.amount,
      );

  static CurrencyType _getCurrencyType(String type) {
    switch (type) {
      case "Fiat":
        return CurrencyType.fiat;

      default:
        return CurrencyType.crypto;
    }
  }
}
