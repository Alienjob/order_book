
part of 'market_list_bloc.dart';

@freezed
class MarketListState with _$MarketListState {
  factory MarketListState({

    @Default(false)
    final bool isProcessing,
    final MarketList? marketList,

  }) = _MarketListState;
}
