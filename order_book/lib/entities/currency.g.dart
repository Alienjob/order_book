// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: json['id'] as int?,
      name: json['name'] as String?,
      aliases:
          (json['aliases'] as List<dynamic>?)?.map((e) => e as String).toList(),
      title: json['title'] as String?,
      type: json['type'] as String?,
      isEnabled: json['isEnabled'] as bool?,
      amount: (json['amount'] as num?)?.toDouble(),
      serviceFee: (json['serviceFee'] as num?)?.toDouble(),
      decimals: json['decimals'] as int?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'aliases': instance.aliases,
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'type': instance.type,
      'isEnabled': instance.isEnabled,
      'serviceFee': instance.serviceFee,
      'amount': instance.amount,
      'decimals': instance.decimals,
      'icon': instance.icon,
    };
