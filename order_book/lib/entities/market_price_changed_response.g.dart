// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_price_changed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketPriceChangedResponse _$MarketPriceChangedResponseFromJson(
        Map<String, dynamic> json) =>
    MarketPriceChangedResponse(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : MarketPriceDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      time: json['time'] as String?,
      derivedCurrencyList: (json['derivedCurrencyList'] as List<dynamic>?)
          ?.map((e) =>
              DerivedCurrencyListResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
    )..timestamp = json['timestamp'] as int?;

Map<String, dynamic> _$MarketPriceChangedResponseToJson(
        MarketPriceChangedResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'time': instance.time,
      'timestamp': instance.timestamp,
      'id': instance.id,
      'derivedCurrencyList': instance.derivedCurrencyList,
    };

MarketPriceDataResponse _$MarketPriceDataResponseFromJson(
        Map<String, dynamic> json) =>
    MarketPriceDataResponse(
      marketId: json['marketId'] as int?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MarketPriceDataResponseToJson(
        MarketPriceDataResponse instance) =>
    <String, dynamic>{
      'marketId': instance.marketId,
      'price': instance.price,
    };
