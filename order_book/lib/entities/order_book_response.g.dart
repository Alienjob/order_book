// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_book_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBookResponse _$OrderBookResponseFromJson(Map<String, dynamic> json) =>
    OrderBookResponse(
      name: json['name'] as String?,
      asks: (json['asks'] as List<dynamic>?)
          ?.map((e) =>
              OrderBookAskBidResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      bids: (json['bids'] as List<dynamic>?)
          ?.map((e) =>
              OrderBookAskBidResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: json['timestamp'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$OrderBookResponseToJson(OrderBookResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'asks': instance.asks,
      'bids': instance.bids,
      'timestamp': instance.timestamp,
      'total': instance.total,
    };
