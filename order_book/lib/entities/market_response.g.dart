// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketResponse _$MarketResponseFromJson(Map<String, dynamic> json) =>
    MarketResponse(
      currencyId: json['currencyId'] as int?,
      type: json['type'] as int?,
      decimals: json['decimals'] as int?,
      currencyName: json['currencyName'] as String?,
      derivedCurrencyList: (json['derivedCurrencyList'] as List<dynamic>?)
          ?.map((e) =>
              DerivedCurrencyListResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarketResponseToJson(MarketResponse instance) =>
    <String, dynamic>{
      'currencyId': instance.currencyId,
      'type': instance.type,
      'decimals': instance.decimals,
      'currencyName': instance.currencyName,
      'derivedCurrencyList': instance.derivedCurrencyList,
    };
