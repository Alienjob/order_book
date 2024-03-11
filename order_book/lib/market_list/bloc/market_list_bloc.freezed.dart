// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MarketListState {
  bool get isProcessing => throw _privateConstructorUsedError;
  MarketList? get marketList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarketListStateCopyWith<MarketListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketListStateCopyWith<$Res> {
  factory $MarketListStateCopyWith(
          MarketListState value, $Res Function(MarketListState) then) =
      _$MarketListStateCopyWithImpl<$Res, MarketListState>;
  @useResult
  $Res call({bool isProcessing, MarketList? marketList});
}

/// @nodoc
class _$MarketListStateCopyWithImpl<$Res, $Val extends MarketListState>
    implements $MarketListStateCopyWith<$Res> {
  _$MarketListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? marketList = freezed,
  }) {
    return _then(_value.copyWith(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      marketList: freezed == marketList
          ? _value.marketList
          : marketList // ignore: cast_nullable_to_non_nullable
              as MarketList?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketListStateImplCopyWith<$Res>
    implements $MarketListStateCopyWith<$Res> {
  factory _$$MarketListStateImplCopyWith(_$MarketListStateImpl value,
          $Res Function(_$MarketListStateImpl) then) =
      __$$MarketListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isProcessing, MarketList? marketList});
}

/// @nodoc
class __$$MarketListStateImplCopyWithImpl<$Res>
    extends _$MarketListStateCopyWithImpl<$Res, _$MarketListStateImpl>
    implements _$$MarketListStateImplCopyWith<$Res> {
  __$$MarketListStateImplCopyWithImpl(
      _$MarketListStateImpl _value, $Res Function(_$MarketListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isProcessing = null,
    Object? marketList = freezed,
  }) {
    return _then(_$MarketListStateImpl(
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      marketList: freezed == marketList
          ? _value.marketList
          : marketList // ignore: cast_nullable_to_non_nullable
              as MarketList?,
    ));
  }
}

/// @nodoc

class _$MarketListStateImpl implements _MarketListState {
  _$MarketListStateImpl({this.isProcessing = false, this.marketList});

  @override
  @JsonKey()
  final bool isProcessing;
  @override
  final MarketList? marketList;

  @override
  String toString() {
    return 'MarketListState(isProcessing: $isProcessing, marketList: $marketList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketListStateImpl &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.marketList, marketList) ||
                other.marketList == marketList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isProcessing, marketList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketListStateImplCopyWith<_$MarketListStateImpl> get copyWith =>
      __$$MarketListStateImplCopyWithImpl<_$MarketListStateImpl>(
          this, _$identity);
}

abstract class _MarketListState implements MarketListState {
  factory _MarketListState(
      {final bool isProcessing,
      final MarketList? marketList}) = _$MarketListStateImpl;

  @override
  bool get isProcessing;
  @override
  MarketList? get marketList;
  @override
  @JsonKey(ignore: true)
  _$$MarketListStateImplCopyWith<_$MarketListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MarketListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(MarketList data) dataRecieved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(MarketList data)? dataRecieved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(MarketList data)? dataRecieved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(DataRecieved value) dataRecieved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(DataRecieved value)? dataRecieved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(DataRecieved value)? dataRecieved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketListEventCopyWith<$Res> {
  factory $MarketListEventCopyWith(
          MarketListEvent value, $Res Function(MarketListEvent) then) =
      _$MarketListEventCopyWithImpl<$Res, MarketListEvent>;
}

/// @nodoc
class _$MarketListEventCopyWithImpl<$Res, $Val extends MarketListEvent>
    implements $MarketListEventCopyWith<$Res> {
  _$MarketListEventCopyWithImpl(this._value, this._then);

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
    extends _$MarketListEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'MarketListEvent.init()';
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
    required TResult Function(MarketList data) dataRecieved,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(MarketList data)? dataRecieved,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(MarketList data)? dataRecieved,
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
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(DataRecieved value)? dataRecieved,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(DataRecieved value)? dataRecieved,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements MarketListEvent {
  const factory Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$DataRecievedImplCopyWith<$Res> {
  factory _$$DataRecievedImplCopyWith(
          _$DataRecievedImpl value, $Res Function(_$DataRecievedImpl) then) =
      __$$DataRecievedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MarketList data});
}

/// @nodoc
class __$$DataRecievedImplCopyWithImpl<$Res>
    extends _$MarketListEventCopyWithImpl<$Res, _$DataRecievedImpl>
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
              as MarketList,
    ));
  }
}

/// @nodoc

class _$DataRecievedImpl implements DataRecieved {
  const _$DataRecievedImpl({required this.data});

  @override
  final MarketList data;

  @override
  String toString() {
    return 'MarketListEvent.dataRecieved(data: $data)';
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
    required TResult Function(MarketList data) dataRecieved,
  }) {
    return dataRecieved(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(MarketList data)? dataRecieved,
  }) {
    return dataRecieved?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(MarketList data)? dataRecieved,
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
  }) {
    return dataRecieved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(DataRecieved value)? dataRecieved,
  }) {
    return dataRecieved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(DataRecieved value)? dataRecieved,
    required TResult orElse(),
  }) {
    if (dataRecieved != null) {
      return dataRecieved(this);
    }
    return orElse();
  }
}

abstract class DataRecieved implements MarketListEvent {
  const factory DataRecieved({required final MarketList data}) =
      _$DataRecievedImpl;

  MarketList get data;
  @JsonKey(ignore: true)
  _$$DataRecievedImplCopyWith<_$DataRecievedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
