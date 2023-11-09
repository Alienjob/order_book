import 'package:json_annotation/json_annotation.dart';

part 'order_book_askbid_response.g.dart';

// {
//   "numberOfOrders": 0,
//   "price": 0,
//   "quantity": 0
// }

@JsonSerializable()
class OrderBookAskBidResponse {
  int? numberOfOrders;
  double? price;
  double? quantity;

  OrderBookAskBidResponse({
    this.numberOfOrders, 
    this.price,
    this.quantity,
    });

  factory OrderBookAskBidResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderBookAskBidResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBookAskBidResponseToJson(this);
}
