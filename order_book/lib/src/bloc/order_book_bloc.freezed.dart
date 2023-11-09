// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_book_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderBookState {
  MarketPriceEntity? get market => throw _privateConstructorUsedError;
  OrderBookViewData? get orderBook => throw _privateConstructorUsedError;
  OrderBookControl? get control => throw _privateConstructorUsedError;
  OrderBookCurrentPrice? get currentPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderBookStateCopyWith<OrderBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderBookStateCopyWith<$Res> {
  factory $OrderBookStateCopyWith(
          OrderBookState value, $Res Function(OrderBookState) then) =
      _$OrderBookStateCopyWithImpl<$Res, OrderBookState>;
  @useResult
  $Res call(
      {MarketPriceEntity? market,
      OrderBookViewData? orderBook,
      OrderBookControl? control,
      OrderBookCurrentPrice? currentPrice});

  $OrderBookControlCopyWith<$Res>? get control;
  $OrderBookCurrentPriceCopyWith<$Res>? get currentPrice;
}

/// @nodoc
class _$OrderBookStateCopyWithImpl<$Res, $Val extends OrderBookState>
    implements $OrderBookStateCopyWith<$Res> {
  _$OrderBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = freezed,
    Object? orderBook = freezed,
    Object? control = freezed,
    Object? currentPrice = freezed,
  }) {
    return _then(_value.copyWith(
      market: freezed == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as MarketPriceEntity?,
      orderBook: freezed == orderBook
          ? _value.orderBook
          : orderBook // ignore: cast_nullable_to_non_nullable
              as OrderBookViewData?,
      control: freezed == control
          ? _value.control
          : control // ignore: cast_nullable_to_non_nullable
              as OrderBookControl?,
      currentPrice: freezed == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as OrderBookCurrentPrice?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderBookControlCopyWith<$Res>? get control {
    if (_value.control == null) {
      return null;
    }

    return $OrderBookControlCopyWith<$Res>(_value.control!, (value) {
      return _then(_value.copyWith(control: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderBookCurrentPriceCopyWith<$Res>? get currentPrice {
    if (_value.currentPrice == null) {
      return null;
    }

    return $OrderBookCurrentPriceCopyWith<$Res>(_value.currentPrice!, (value) {
      return _then(_value.copyWith(currentPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderBookStateImplCopyWith<$Res>
    implements $OrderBookStateCopyWith<$Res> {
  factory _$$OrderBookStateImplCopyWith(_$OrderBookStateImpl value,
          $Res Function(_$OrderBookStateImpl) then) =
      __$$OrderBookStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MarketPriceEntity? market,
      OrderBookViewData? orderBook,
      OrderBookControl? control,
      OrderBookCurrentPrice? currentPrice});

  @override
  $OrderBookControlCopyWith<$Res>? get control;
  @override
  $OrderBookCurrentPriceCopyWith<$Res>? get currentPrice;
}

/// @nodoc
class __$$OrderBookStateImplCopyWithImpl<$Res>
    extends _$OrderBookStateCopyWithImpl<$Res, _$OrderBookStateImpl>
    implements _$$OrderBookStateImplCopyWith<$Res> {
  __$$OrderBookStateImplCopyWithImpl(
      _$OrderBookStateImpl _value, $Res Function(_$OrderBookStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = freezed,
    Object? orderBook = freezed,
    Object? control = freezed,
    Object? currentPrice = freezed,
  }) {
    return _then(_$OrderBookStateImpl(
      market: freezed == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as MarketPriceEntity?,
      orderBook: freezed == orderBook
          ? _value.orderBook
          : orderBook // ignore: cast_nullable_to_non_nullable
              as OrderBookViewData?,
      control: freezed == control
          ? _value.control
          : control // ignore: cast_nullable_to_non_nullable
              as OrderBookControl?,
      currentPrice: freezed == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as OrderBookCurrentPrice?,
    ));
  }
}

/// @nodoc

class _$OrderBookStateImpl implements _OrderBookState {
  _$OrderBookStateImpl(
      {this.market, this.orderBook, this.control, this.currentPrice});

  @override
  final MarketPriceEntity? market;
  @override
  final OrderBookViewData? orderBook;
  @override
  final OrderBookControl? control;
  @override
  final OrderBookCurrentPrice? currentPrice;

  @override
  String toString() {
    return 'OrderBookState(market: $market, orderBook: $orderBook, control: $control, currentPrice: $currentPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderBookStateImpl &&
            (identical(other.market, market) || other.market == market) &&
            (identical(other.orderBook, orderBook) ||
                other.orderBook == orderBook) &&
            (identical(other.control, control) || other.control == control) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, market, orderBook, control, currentPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderBookStateImplCopyWith<_$OrderBookStateImpl> get copyWith =>
      __$$OrderBookStateImplCopyWithImpl<_$OrderBookStateImpl>(
          this, _$identity);
}

abstract class _OrderBookState implements OrderBookState {
  factory _OrderBookState(
      {final MarketPriceEntity? market,
      final OrderBookViewData? orderBook,
      final OrderBookControl? control,
      final OrderBookCurrentPrice? currentPrice}) = _$OrderBookStateImpl;

  @override
  MarketPriceEntity? get market;
  @override
  OrderBookViewData? get orderBook;
  @override
  OrderBookControl? get control;
  @override
  OrderBookCurrentPrice? get currentPrice;
  @override
  @JsonKey(ignore: true)
  _$$OrderBookStateImplCopyWith<_$OrderBookStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderBookEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(OrderBookViewData data) dataRecieved,
    required TResult Function(OrderBookRound round) roundChanged,
    required TResult Function(OrderBookPresentationSection presentationSection)
        presentationSectionChanged,
    required TResult Function(bool listening) listeningChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(OrderBookViewData data)? dataRecieved,
    TResult? Function(OrderBookRound round)? roundChanged,
    TResult? Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult? Function(bool listening)? listeningChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(OrderBookViewData data)? dataRecieved,
    TResult Function(OrderBookRound round)? roundChanged,
    TResult Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult Function(bool listening)? listeningChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(DataRecieved value) dataRecieved,
    required TResult Function(RoundChanged value) roundChanged,
    required TResult Function(PresentationSectionChanged value)
        presentationSectionChanged,
    required TResult Function(ListeningChanged value) listeningChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(DataRecieved value)? dataRecieved,
    TResult? Function(RoundChanged value)? roundChanged,
    TResult? Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult? Function(ListeningChanged value)? listeningChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(DataRecieved value)? dataRecieved,
    TResult Function(RoundChanged value)? roundChanged,
    TResult Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult Function(ListeningChanged value)? listeningChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderBookEventCopyWith<$Res> {
  factory $OrderBookEventCopyWith(
          OrderBookEvent value, $Res Function(OrderBookEvent) then) =
      _$OrderBookEventCopyWithImpl<$Res, OrderBookEvent>;
}

/// @nodoc
class _$OrderBookEventCopyWithImpl<$Res, $Val extends OrderBookEvent>
    implements $OrderBookEventCopyWith<$Res> {
  _$OrderBookEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$OrderBookEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'OrderBookEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(OrderBookViewData data) dataRecieved,
    required TResult Function(OrderBookRound round) roundChanged,
    required TResult Function(OrderBookPresentationSection presentationSection)
        presentationSectionChanged,
    required TResult Function(bool listening) listeningChanged,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(OrderBookViewData data)? dataRecieved,
    TResult? Function(OrderBookRound round)? roundChanged,
    TResult? Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult? Function(bool listening)? listeningChanged,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(OrderBookViewData data)? dataRecieved,
    TResult Function(OrderBookRound round)? roundChanged,
    TResult Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult Function(bool listening)? listeningChanged,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(DataRecieved value) dataRecieved,
    required TResult Function(RoundChanged value) roundChanged,
    required TResult Function(PresentationSectionChanged value)
        presentationSectionChanged,
    required TResult Function(ListeningChanged value) listeningChanged,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(DataRecieved value)? dataRecieved,
    TResult? Function(RoundChanged value)? roundChanged,
    TResult? Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult? Function(ListeningChanged value)? listeningChanged,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(DataRecieved value)? dataRecieved,
    TResult Function(RoundChanged value)? roundChanged,
    TResult Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult Function(ListeningChanged value)? listeningChanged,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements OrderBookEvent {
  const factory Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$DataRecievedImplCopyWith<$Res> {
  factory _$$DataRecievedImplCopyWith(
          _$DataRecievedImpl value, $Res Function(_$DataRecievedImpl) then) =
      __$$DataRecievedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderBookViewData data});
}

/// @nodoc
class __$$DataRecievedImplCopyWithImpl<$Res>
    extends _$OrderBookEventCopyWithImpl<$Res, _$DataRecievedImpl>
    implements _$$DataRecievedImplCopyWith<$Res> {
  __$$DataRecievedImplCopyWithImpl(
      _$DataRecievedImpl _value, $Res Function(_$DataRecievedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DataRecievedImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OrderBookViewData,
    ));
  }
}

/// @nodoc

class _$DataRecievedImpl implements DataRecieved {
  const _$DataRecievedImpl({required this.data});

  @override
  final OrderBookViewData data;

  @override
  String toString() {
    return 'OrderBookEvent.dataRecieved(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataRecievedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataRecievedImplCopyWith<_$DataRecievedImpl> get copyWith =>
      __$$DataRecievedImplCopyWithImpl<_$DataRecievedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(OrderBookViewData data) dataRecieved,
    required TResult Function(OrderBookRound round) roundChanged,
    required TResult Function(OrderBookPresentationSection presentationSection)
        presentationSectionChanged,
    required TResult Function(bool listening) listeningChanged,
  }) {
    return dataRecieved(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(OrderBookViewData data)? dataRecieved,
    TResult? Function(OrderBookRound round)? roundChanged,
    TResult? Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult? Function(bool listening)? listeningChanged,
  }) {
    return dataRecieved?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(OrderBookViewData data)? dataRecieved,
    TResult Function(OrderBookRound round)? roundChanged,
    TResult Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult Function(bool listening)? listeningChanged,
    required TResult orElse(),
  }) {
    if (dataRecieved != null) {
      return dataRecieved(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(DataRecieved value) dataRecieved,
    required TResult Function(RoundChanged value) roundChanged,
    required TResult Function(PresentationSectionChanged value)
        presentationSectionChanged,
    required TResult Function(ListeningChanged value) listeningChanged,
  }) {
    return dataRecieved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(DataRecieved value)? dataRecieved,
    TResult? Function(RoundChanged value)? roundChanged,
    TResult? Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult? Function(ListeningChanged value)? listeningChanged,
  }) {
    return dataRecieved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(DataRecieved value)? dataRecieved,
    TResult Function(RoundChanged value)? roundChanged,
    TResult Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult Function(ListeningChanged value)? listeningChanged,
    required TResult orElse(),
  }) {
    if (dataRecieved != null) {
      return dataRecieved(this);
    }
    return orElse();
  }
}

abstract class DataRecieved implements OrderBookEvent {
  const factory DataRecieved({required final OrderBookViewData data}) =
      _$DataRecievedImpl;

  OrderBookViewData get data;
  @JsonKey(ignore: true)
  _$$DataRecievedImplCopyWith<_$DataRecievedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoundChangedImplCopyWith<$Res> {
  factory _$$RoundChangedImplCopyWith(
          _$RoundChangedImpl value, $Res Function(_$RoundChangedImpl) then) =
      __$$RoundChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderBookRound round});
}

/// @nodoc
class __$$RoundChangedImplCopyWithImpl<$Res>
    extends _$OrderBookEventCopyWithImpl<$Res, _$RoundChangedImpl>
    implements _$$RoundChangedImplCopyWith<$Res> {
  __$$RoundChangedImplCopyWithImpl(
      _$RoundChangedImpl _value, $Res Function(_$RoundChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? round = null,
  }) {
    return _then(_$RoundChangedImpl(
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as OrderBookRound,
    ));
  }
}

/// @nodoc

class _$RoundChangedImpl implements RoundChanged {
  const _$RoundChangedImpl({required this.round});

  @override
  final OrderBookRound round;

  @override
  String toString() {
    return 'OrderBookEvent.roundChanged(round: $round)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoundChangedImpl &&
            (identical(other.round, round) || other.round == round));
  }

  @override
  int get hashCode => Object.hash(runtimeType, round);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoundChangedImplCopyWith<_$RoundChangedImpl> get copyWith =>
      __$$RoundChangedImplCopyWithImpl<_$RoundChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(OrderBookViewData data) dataRecieved,
    required TResult Function(OrderBookRound round) roundChanged,
    required TResult Function(OrderBookPresentationSection presentationSection)
        presentationSectionChanged,
    required TResult Function(bool listening) listeningChanged,
  }) {
    return roundChanged(round);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(OrderBookViewData data)? dataRecieved,
    TResult? Function(OrderBookRound round)? roundChanged,
    TResult? Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult? Function(bool listening)? listeningChanged,
  }) {
    return roundChanged?.call(round);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(OrderBookViewData data)? dataRecieved,
    TResult Function(OrderBookRound round)? roundChanged,
    TResult Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult Function(bool listening)? listeningChanged,
    required TResult orElse(),
  }) {
    if (roundChanged != null) {
      return roundChanged(round);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(DataRecieved value) dataRecieved,
    required TResult Function(RoundChanged value) roundChanged,
    required TResult Function(PresentationSectionChanged value)
        presentationSectionChanged,
    required TResult Function(ListeningChanged value) listeningChanged,
  }) {
    return roundChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(DataRecieved value)? dataRecieved,
    TResult? Function(RoundChanged value)? roundChanged,
    TResult? Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult? Function(ListeningChanged value)? listeningChanged,
  }) {
    return roundChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(DataRecieved value)? dataRecieved,
    TResult Function(RoundChanged value)? roundChanged,
    TResult Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult Function(ListeningChanged value)? listeningChanged,
    required TResult orElse(),
  }) {
    if (roundChanged != null) {
      return roundChanged(this);
    }
    return orElse();
  }
}

abstract class RoundChanged implements OrderBookEvent {
  const factory RoundChanged({required final OrderBookRound round}) =
      _$RoundChangedImpl;

  OrderBookRound get round;
  @JsonKey(ignore: true)
  _$$RoundChangedImplCopyWith<_$RoundChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PresentationSectionChangedImplCopyWith<$Res> {
  factory _$$PresentationSectionChangedImplCopyWith(
          _$PresentationSectionChangedImpl value,
          $Res Function(_$PresentationSectionChangedImpl) then) =
      __$$PresentationSectionChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderBookPresentationSection presentationSection});
}

/// @nodoc
class __$$PresentationSectionChangedImplCopyWithImpl<$Res>
    extends _$OrderBookEventCopyWithImpl<$Res, _$PresentationSectionChangedImpl>
    implements _$$PresentationSectionChangedImplCopyWith<$Res> {
  __$$PresentationSectionChangedImplCopyWithImpl(
      _$PresentationSectionChangedImpl _value,
      $Res Function(_$PresentationSectionChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presentationSection = null,
  }) {
    return _then(_$PresentationSectionChangedImpl(
      presentationSection: null == presentationSection
          ? _value.presentationSection
          : presentationSection // ignore: cast_nullable_to_non_nullable
              as OrderBookPresentationSection,
    ));
  }
}

/// @nodoc

class _$PresentationSectionChangedImpl implements PresentationSectionChanged {
  const _$PresentationSectionChangedImpl({required this.presentationSection});

  @override
  final OrderBookPresentationSection presentationSection;

  @override
  String toString() {
    return 'OrderBookEvent.presentationSectionChanged(presentationSection: $presentationSection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresentationSectionChangedImpl &&
            (identical(other.presentationSection, presentationSection) ||
                other.presentationSection == presentationSection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, presentationSection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresentationSectionChangedImplCopyWith<_$PresentationSectionChangedImpl>
      get copyWith => __$$PresentationSectionChangedImplCopyWithImpl<
          _$PresentationSectionChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(OrderBookViewData data) dataRecieved,
    required TResult Function(OrderBookRound round) roundChanged,
    required TResult Function(OrderBookPresentationSection presentationSection)
        presentationSectionChanged,
    required TResult Function(bool listening) listeningChanged,
  }) {
    return presentationSectionChanged(presentationSection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(OrderBookViewData data)? dataRecieved,
    TResult? Function(OrderBookRound round)? roundChanged,
    TResult? Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult? Function(bool listening)? listeningChanged,
  }) {
    return presentationSectionChanged?.call(presentationSection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(OrderBookViewData data)? dataRecieved,
    TResult Function(OrderBookRound round)? roundChanged,
    TResult Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult Function(bool listening)? listeningChanged,
    required TResult orElse(),
  }) {
    if (presentationSectionChanged != null) {
      return presentationSectionChanged(presentationSection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(DataRecieved value) dataRecieved,
    required TResult Function(RoundChanged value) roundChanged,
    required TResult Function(PresentationSectionChanged value)
        presentationSectionChanged,
    required TResult Function(ListeningChanged value) listeningChanged,
  }) {
    return presentationSectionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(DataRecieved value)? dataRecieved,
    TResult? Function(RoundChanged value)? roundChanged,
    TResult? Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult? Function(ListeningChanged value)? listeningChanged,
  }) {
    return presentationSectionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(DataRecieved value)? dataRecieved,
    TResult Function(RoundChanged value)? roundChanged,
    TResult Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult Function(ListeningChanged value)? listeningChanged,
    required TResult orElse(),
  }) {
    if (presentationSectionChanged != null) {
      return presentationSectionChanged(this);
    }
    return orElse();
  }
}

abstract class PresentationSectionChanged implements OrderBookEvent {
  const factory PresentationSectionChanged(
          {required final OrderBookPresentationSection presentationSection}) =
      _$PresentationSectionChangedImpl;

  OrderBookPresentationSection get presentationSection;
  @JsonKey(ignore: true)
  _$$PresentationSectionChangedImplCopyWith<_$PresentationSectionChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListeningChangedImplCopyWith<$Res> {
  factory _$$ListeningChangedImplCopyWith(_$ListeningChangedImpl value,
          $Res Function(_$ListeningChangedImpl) then) =
      __$$ListeningChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool listening});
}

/// @nodoc
class __$$ListeningChangedImplCopyWithImpl<$Res>
    extends _$OrderBookEventCopyWithImpl<$Res, _$ListeningChangedImpl>
    implements _$$ListeningChangedImplCopyWith<$Res> {
  __$$ListeningChangedImplCopyWithImpl(_$ListeningChangedImpl _value,
      $Res Function(_$ListeningChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listening = null,
  }) {
    return _then(_$ListeningChangedImpl(
      listening: null == listening
          ? _value.listening
          : listening // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ListeningChangedImpl implements ListeningChanged {
  const _$ListeningChangedImpl({required this.listening});

  @override
  final bool listening;

  @override
  String toString() {
    return 'OrderBookEvent.listeningChanged(listening: $listening)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningChangedImpl &&
            (identical(other.listening, listening) ||
                other.listening == listening));
  }

  @override
  int get hashCode => Object.hash(runtimeType, listening);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningChangedImplCopyWith<_$ListeningChangedImpl> get copyWith =>
      __$$ListeningChangedImplCopyWithImpl<_$ListeningChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(OrderBookViewData data) dataRecieved,
    required TResult Function(OrderBookRound round) roundChanged,
    required TResult Function(OrderBookPresentationSection presentationSection)
        presentationSectionChanged,
    required TResult Function(bool listening) listeningChanged,
  }) {
    return listeningChanged(listening);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(OrderBookViewData data)? dataRecieved,
    TResult? Function(OrderBookRound round)? roundChanged,
    TResult? Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult? Function(bool listening)? listeningChanged,
  }) {
    return listeningChanged?.call(listening);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(OrderBookViewData data)? dataRecieved,
    TResult Function(OrderBookRound round)? roundChanged,
    TResult Function(OrderBookPresentationSection presentationSection)?
        presentationSectionChanged,
    TResult Function(bool listening)? listeningChanged,
    required TResult orElse(),
  }) {
    if (listeningChanged != null) {
      return listeningChanged(listening);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(DataRecieved value) dataRecieved,
    required TResult Function(RoundChanged value) roundChanged,
    required TResult Function(PresentationSectionChanged value)
        presentationSectionChanged,
    required TResult Function(ListeningChanged value) listeningChanged,
  }) {
    return listeningChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(DataRecieved value)? dataRecieved,
    TResult? Function(RoundChanged value)? roundChanged,
    TResult? Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult? Function(ListeningChanged value)? listeningChanged,
  }) {
    return listeningChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(DataRecieved value)? dataRecieved,
    TResult Function(RoundChanged value)? roundChanged,
    TResult Function(PresentationSectionChanged value)?
        presentationSectionChanged,
    TResult Function(ListeningChanged value)? listeningChanged,
    required TResult orElse(),
  }) {
    if (listeningChanged != null) {
      return listeningChanged(this);
    }
    return orElse();
  }
}

abstract class ListeningChanged implements OrderBookEvent {
  const factory ListeningChanged({required final bool listening}) =
      _$ListeningChangedImpl;

  bool get listening;
  @JsonKey(ignore: true)
  _$$ListeningChangedImplCopyWith<_$ListeningChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
