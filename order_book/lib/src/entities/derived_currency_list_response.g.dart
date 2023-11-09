// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'derived_currency_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DerivedCurrencyListResponse _$DerivedCurrencyListResponseFromJson(
        Map<String, dynamic> json) =>
    DerivedCurrencyListResponse(
      marketId: json['marketId'] as int?,
      derivedCurrencyId: json['derivedCurrencyId'] as int?,
      type: json['type'] as int?,
      decimals: json['decimals'] as int?,
      derivedCurrencyName: json['derivedCurrencyName'] as String?,
      highPrice: (json['highPrice'] as num?)?.toDouble(),
      lowPrice: (json['lowPrice'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      priceChange: (json['priceChange'] as num?)?.toDouble(),
      minOrderAmount: (json['minOrderAmount'] as num?)?.toDouble(),
      maxOrderAmount: (json['maxOrderAmount'] as num?)?.toDouble(),
      minOrderPrice: (json['minOrderPrice'] as num?)?.toDouble(),
      maxOrderPrice: (json['maxOrderPrice'] as num?)?.toDouble(),
      sortId: (json['sortId'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DerivedCurrencyListResponseToJson(
        DerivedCurrencyListResponse instance) =>
    <String, dynamic>{
      'marketId': instance.marketId,
      'derivedCurrencyId': instance.derivedCurrencyId,
      'type': instance.type,
      'decimals': instance.decimals,
      'derivedCurrencyName': instance.derivedCurrencyName,
      'highPrice': instance.highPrice,
      'lowPrice': instance.lowPrice,
      'price': instance.price,
      'volume': instance.volume,
      'priceChange': instance.priceChange,
      'minOrderAmount': instance.minOrderAmount,
      'maxOrderAmount': instance.maxOrderAmount,
      'minOrderPrice': instance.minOrderPrice,
      'maxOrderPrice': instance.maxOrderPrice,
      'sortId': instance.sortId,
    };
