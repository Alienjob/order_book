import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_book/src/entities/buy_sell.dart';
import 'package:order_book/src/entities/order_book_change_response.dart';

part "order_book_change_entity.g.dart";

@JsonSerializable()
class OrderBookChangeEntity {
  int? id;
  int? marketId;
  BuySell? side;
  Decimal? amount;
  Decimal? price;
  int? count;
  bool? add;
  DateTime? time;
  int? timestamp;

  OrderBookChangeEntity({
    this.id,
    this.marketId,
    this.side,
    this.amount,
    this.price,
    this.count,
    this.add,
    this.time,
    this.timestamp,
  });

  factory OrderBookChangeEntity.fromResponse(
          {required OrderBookChangeResponse response,
          required DateTime? time,
          required int? timestamp}) =>
      OrderBookChangeEntity(
        id: response.id,
        marketId: response.marketId,
        side:
            (response.side == BuySell.buy.number) ? BuySell.buy : BuySell.sell,
        amount: Decimal.tryParse('${response.amount}'),
        price: Decimal.tryParse('${response.price}'),
        count: response.count,
        add: response.add,
        time: time,
        timestamp: timestamp,
      );
  factory OrderBookChangeEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderBookChangeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBookChangeEntityToJson(this);
}