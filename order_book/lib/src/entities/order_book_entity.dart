

import 'package:order_book/src/entities/order_book_askbid_entity.dart';
import 'package:order_book/src/entities/order_book_response.dart';

class OrderBookEntity {
  String? name;
  List<OrderBookAskBidEntity>? asks;
  List<OrderBookAskBidEntity>? bids;
  DateTime? time;
  int? total;

  OrderBookEntity({
    this.name, 
    this.asks, 
    this.bids, 
    this.time, 
    this.total, 
    });

  factory OrderBookEntity.fromResponse(OrderBookResponse response) => OrderBookEntity(
      name: response.name,
      time: DateTime.tryParse(response.time??'null'),
      total: response.total,
      asks: response.asks?.map((e) => OrderBookAskBidEntity.fromResponse(e)).toList(),
      bids: response.bids?.map((e) => OrderBookAskBidEntity.fromResponse(e)).toList(),
      );
}
