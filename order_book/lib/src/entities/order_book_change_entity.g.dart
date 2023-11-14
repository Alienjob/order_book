// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_book_change_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBookChangeEntity _$OrderBookChangeEntityFromJson(
        Map<String, dynamic> json) =>
    OrderBookChangeEntity(
      id: json['id'] as int?,
      marketId: json['marketId'] as int?,
      side: $enumDecodeNullable(_$BuySellEnumMap, json['side']),
      amount: json['amount'] == null
          ? null
          : Decimal.fromJson(json['amount'] as String),
      price: json['price'] == null
          ? null
          : Decimal.fromJson(json['price'] as String),
      count: json['count'] as int?,
      add: json['add'] as bool?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$OrderBookChangeEntityToJson(
        OrderBookChangeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'marketId': instance.marketId,
      'side': _$BuySellEnumMap[instance.side],
      'amount': OrderBookChangeEntity._decimalToJson(instance.amount),
      'price': OrderBookChangeEntity._decimalToJson(instance.price),
      'count': instance.count,
      'add': instance.add,
      'time': instance.time?.toIso8601String(),
      'timestamp': instance.timestamp,
    };

const _$BuySellEnumMap = {
  BuySell.buy: 0,
  BuySell.sell: 1,
};
