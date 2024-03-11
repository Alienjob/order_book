// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_book_askbid_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBookAskBidResponse _$OrderBookAskBidResponseFromJson(
        Map<String, dynamic> json) =>
    OrderBookAskBidResponse(
      numberOfOrders: json['numberOfOrders'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderBookAskBidResponseToJson(
        OrderBookAskBidResponse instance) =>
    <String, dynamic>{
      'numberOfOrders': instance.numberOfOrders,
      'price': instance.price,
      'quantity': instance.quantity,
    };
