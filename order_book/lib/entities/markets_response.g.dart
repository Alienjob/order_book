// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketsResponse _$MarketsResponseFromJson(Map<String, dynamic> json) =>
    MarketsResponse(
      marketsList: (json['marketsList'] as List<dynamic>?)
          ?.map((e) => MarketResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toDouble(),
      availableTypes: (json['availableTypes'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$MarketsResponseToJson(MarketsResponse instance) =>
    <String, dynamic>{
      'marketsList': instance.marketsList,
      'total': instance.total,
      'availableTypes': instance.availableTypes,
    };
