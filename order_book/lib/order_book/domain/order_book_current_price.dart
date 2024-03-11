
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_book_current_price.freezed.dart';

@freezed
abstract class OrderBookCurrentPrice with _$OrderBookCurrentPrice{
  const factory OrderBookCurrentPrice(
    {
    required double price,
    required double priceUSD,
    required double change,
    required double changePercent,
    }
  ) = _OrderBookCurrentPrice;
}
