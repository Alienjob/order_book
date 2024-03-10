

import 'order_book_askbid_entity.dart';
import 'order_book_response.dart';

class OrderBookEntity {
  String? name;
  List<OrderBookAskBidEntity>? asks;
  List<OrderBookAskBidEntity>? bids;
  int? timestamp;
  int? total;

  OrderBookEntity({
    this.name, 
    this.asks, 
    this.bids, 
    this.timestamp, 
    this.total, 
    });

  factory OrderBookEntity.fromResponse(OrderBookResponse response) => OrderBookEntity(
      name: response.name,
      timestamp: response.timestamp??0,
      total: response.total,
      asks: response.asks?.map((e) => OrderBookAskBidEntity.fromResponse(e)).toList(),
      bids: response.bids?.map((e) => OrderBookAskBidEntity.fromResponse(e)).toList(),
      );
}
