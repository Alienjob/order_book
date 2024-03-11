part of 'order_book_bloc.dart';

@freezed
class OrderBookState with _$OrderBookState {
  factory OrderBookState({
    MarketPriceEntity? market,
    OrderBookViewData? orderBook,
    OrderBookControl? control,
    OrderBookCurrentPrice? currentPrice,
  }) = _OrderBookState;
}
