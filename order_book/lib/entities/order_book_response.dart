import 'package:json_annotation/json_annotation.dart';
import 'order_book_askbid_response.dart';

part 'order_book_response.g.dart';

// {
//   "name": "string",
//   "asks": [ OrderBookAskBidResponse ],
//   "bids": [ OrderBookAskBidResponse ],
//   "time": "2023-06-19T12:47:55.242Z",
//   "total": 0
// }

@JsonSerializable()
class OrderBookResponse {
  String? name;
  List<OrderBookAskBidResponse>? asks;
  List<OrderBookAskBidResponse>? bids;
  int? timestamp;
  int? total;

  OrderBookResponse({
    this.name, 
    this.asks, 
    this.bids, 
    this.timestamp, 
    this.total, 
    });

  factory OrderBookResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderBookResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBookResponseToJson(this);
}
