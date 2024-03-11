import 'package:freezed_annotation/freezed_annotation.dart';
import 'model.dart';

part 'order_book_control.freezed.dart';

@freezed
abstract class OrderBookControl with _$OrderBookControl{
  const factory OrderBookControl(
    {
    required OrderBookPresentationSection section,
    required OrderBookRound round,
    required bool listening,}
  ) = _OrderBookControl;
}
