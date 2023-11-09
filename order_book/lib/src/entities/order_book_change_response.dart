import 'package:json_annotation/json_annotation.dart';


part 'order_book_change_response.g.dart';

// "id":0,
// "marketId":14,
// "side":1,
// "amount":0.0,
// "price":1757.85,
// "count":0,
// "add":true


@JsonSerializable()
class OrderBookChangeResponse {
  int? id;
  int? marketId;
  int? side;
  double? amount;
  double? price;
  int? count;
  bool? add;

  OrderBookChangeResponse({
    this.id, 
    this.marketId, 
    this.side, 
    this.amount, 
    this.price, 
    this.count, 
    this.add, 
    });

  factory OrderBookChangeResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderBookChangeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBookChangeResponseToJson(this);
}
