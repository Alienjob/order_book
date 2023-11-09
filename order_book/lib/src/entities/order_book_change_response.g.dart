// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_book_change_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBookChangeResponse _$OrderBookChangeResponseFromJson(
        Map<String, dynamic> json) =>
    OrderBookChangeResponse(
      id: json['id'] as int?,
      marketId: json['marketId'] as int?,
      side: json['side'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      count: json['count'] as int?,
      add: json['add'] as bool?,
    );

Map<String, dynamic> _$OrderBookChangeResponseToJson(
        OrderBookChangeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'marketId': instance.marketId,
      'side': instance.side,
      'amount': instance.amount,
      'price': instance.price,
      'count': instance.count,
      'add': instance.add,
    };
