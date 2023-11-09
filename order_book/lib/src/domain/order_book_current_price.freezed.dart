// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_book_current_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderBookCurrentPrice {
  double get price => throw _privateConstructorUsedError;
  double get priceUSD => throw _privateConstructorUsedError;
  double get change => throw _privateConstructorUsedError;
  double get changePercent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderBookCurrentPriceCopyWith<OrderBookCurrentPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderBookCurrentPriceCopyWith<$Res> {
  factory $OrderBookCurrentPriceCopyWith(OrderBookCurrentPrice value,
          $Res Function(OrderBookCurrentPrice) then) =
      _$OrderBookCurrentPriceCopyWithImpl<$Res, OrderBookCurrentPrice>;
  @useResult
  $Res call(
      {double price, double priceUSD, double change, double changePercent});
}

/// @nodoc
class _$OrderBookCurrentPriceCopyWithImpl<$Res,
        $Val extends OrderBookCurrentPrice>
    implements $OrderBookCurrentPriceCopyWith<$Res> {
  _$OrderBookCurrentPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? priceUSD = null,
    Object? change = null,
    Object? changePercent = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      priceUSD: null == priceUSD
          ? _value.priceUSD
          : priceUSD // ignore: cast_nullable_to_non_nullable
              as double,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double,
      changePercent: null == changePercent
          ? _value.changePercent
          : changePercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderBookCurrentPriceImplCopyWith<$Res>
    implements $OrderBookCurrentPriceCopyWith<$Res> {
  factory _$$OrderBookCurrentPriceImplCopyWith(
          _$OrderBookCurrentPriceImpl value,
          $Res Function(_$OrderBookCurrentPriceImpl) then) =
      __$$OrderBookCurrentPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double price, double priceUSD, double change, double changePercent});
}

/// @nodoc
class __$$OrderBookCurrentPriceImplCopyWithImpl<$Res>
    extends _$OrderBookCurrentPriceCopyWithImpl<$Res,
        _$OrderBookCurrentPriceImpl>
    implements _$$OrderBookCurrentPriceImplCopyWith<$Res> {
  __$$OrderBookCurrentPriceImplCopyWithImpl(_$OrderBookCurrentPriceImpl _value,
      $Res Function(_$OrderBookCurrentPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? priceUSD = null,
    Object? change = null,
    Object? changePercent = null,
  }) {
    return _then(_$OrderBookCurrentPriceImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      priceUSD: null == priceUSD
          ? _value.priceUSD
          : priceUSD // ignore: cast_nullable_to_non_nullable
              as double,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double,
      changePercent: null == changePercent
          ? _value.changePercent
          : changePercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OrderBookCurrentPriceImpl implements _OrderBookCurrentPrice {
  const _$OrderBookCurrentPriceImpl(
      {required this.price,
      required this.priceUSD,
      required this.change,
      required this.changePercent});

  @override
  final double price;
  @override
  final double priceUSD;
  @override
  final double change;
  @override
  final double changePercent;

  @override
  String toString() {
    return 'OrderBookCurrentPrice(price: $price, priceUSD: $priceUSD, change: $change, changePercent: $changePercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderBookCurrentPriceImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceUSD, priceUSD) ||
                other.priceUSD == priceUSD) &&
            (identical(other.change, change) || other.change == change) &&
            (identical(other.changePercent, changePercent) ||
                other.changePercent == changePercent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, price, priceUSD, change, changePercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderBookCurrentPriceImplCopyWith<_$OrderBookCurrentPriceImpl>
      get copyWith => __$$OrderBookCurrentPriceImplCopyWithImpl<
          _$OrderBookCurrentPriceImpl>(this, _$identity);
}

abstract class _OrderBookCurrentPrice implements OrderBookCurrentPrice {
  const factory _OrderBookCurrentPrice(
      {required final double price,
      required final double priceUSD,
      required final double change,
      required final double changePercent}) = _$OrderBookCurrentPriceImpl;

  @override
  double get price;
  @override
  double get priceUSD;
  @override
  double get change;
  @override
  double get changePercent;
  @override
  @JsonKey(ignore: true)
  _$$OrderBookCurrentPriceImplCopyWith<_$OrderBookCurrentPriceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
