
import 'package:decimal/decimal.dart';
import 'package:order_book/src/entities/order_book_askbid_response.dart';


class OrderBookAskBidEntity {
  int? numberOfOrders;
  Decimal? quantity;
  Decimal? price;  
  DateTime? changed;

  OrderBookAskBidEntity({
    this.numberOfOrders, 
    this.price, 
    this.quantity,
    this.changed,
    });

  factory OrderBookAskBidEntity.fromResponse(OrderBookAskBidResponse response) => OrderBookAskBidEntity(
      numberOfOrders: response.numberOfOrders,
      price: Decimal.tryParse('${response.price}'),
      quantity: Decimal.tryParse('${response.quantity}'),
      );
}
