// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_book_control.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderBookControl {
  OrderBookPresentationSection get section =>
      throw _privateConstructorUsedError;
  OrderBookRound get round => throw _privateConstructorUsedError;
  bool get listening => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderBookControlCopyWith<OrderBookControl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderBookControlCopyWith<$Res> {
  factory $OrderBookControlCopyWith(
          OrderBookControl value, $Res Function(OrderBookControl) then) =
      _$OrderBookControlCopyWithImpl<$Res, OrderBookControl>;
  @useResult
  $Res call(
      {OrderBookPresentationSection section,
      OrderBookRound round,
      bool listening});
}

/// @nodoc
class _$OrderBookControlCopyWithImpl<$Res, $Val extends OrderBookControl>
    implements $OrderBookControlCopyWith<$Res> {
  _$OrderBookControlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? section = null,
    Object? round = null,
    Object? listening = null,
  }) {
    return _then(_value.copyWith(
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as OrderBookPresentationSection,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as OrderBookRound,
      listening: null == listening
          ? _value.listening
          : listening // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderBookControlCopyWith<$Res>
    implements $OrderBookControlCopyWith<$Res> {
  factory _$$_OrderBookControlCopyWith(
          _$_OrderBookControl value, $Res Function(_$_OrderBookControl) then) =
      __$$_OrderBookControlCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderBookPresentationSection section,
      OrderBookRound round,
      bool listening});
}

/// @nodoc
class __$$_OrderBookControlCopyWithImpl<$Res>
    extends _$OrderBookControlCopyWithImpl<$Res, _$_OrderBookControl>
    implements _$$_OrderBookControlCopyWith<$Res> {
  __$$_OrderBookControlCopyWithImpl(
      _$_OrderBookControl _value, $Res Function(_$_OrderBookControl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? section = null,
    Object? round = null,
    Object? listening = null,
  }) {
    return _then(_$_OrderBookControl(
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as OrderBookPresentationSection,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as OrderBookRound,
      listening: null == listening
          ? _value.listening
          : listening // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderBookControl implements _OrderBookControl {
  const _$_OrderBookControl(
      {required this.section, required this.round, required this.listening});

  @override
  final OrderBookPresentationSection section;
  @override
  final OrderBookRound round;
  @override
  final bool listening;

  @override
  String toString() {
    return 'OrderBookControl(section: $section, round: $round, listening: $listening)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderBookControl &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.round, round) || other.round == round) &&
            (identical(other.listening, listening) ||
                other.listening == listening));
  }

  @override
  int get hashCode => Object.hash(runtimeType, section, round, listening);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderBookControlCopyWith<_$_OrderBookControl> get copyWith =>
      __$$_OrderBookControlCopyWithImpl<_$_OrderBookControl>(this, _$identity);
}

abstract class _OrderBookControl implements OrderBookControl {
  const factory _OrderBookControl(
      {required final OrderBookPresentationSection section,
      required final OrderBookRound round,
      required final bool listening}) = _$_OrderBookControl;

  @override
  OrderBookPresentationSection get section;
  @override
  OrderBookRound get round;
  @override
  bool get listening;
  @override
  @JsonKey(ignore: true)
  _$$_OrderBookControlCopyWith<_$_OrderBookControl> get copyWith =>
      throw _privateConstructorUsedError;
}
