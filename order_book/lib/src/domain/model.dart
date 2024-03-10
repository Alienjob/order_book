import '../entities/order_book_askbid_entity.dart';
import '../entities/order_book_change_entity.dart';
import 'package:uuid/uuid.dart';
import 'package:decimal/decimal.dart';


enum OrderBookCrossAxisAlignment { left, right }

enum OrderBookMainAxisSort { asc, desc }

enum OrderBookStaircaseType { ask, bid }

enum OrderBookPresentationSection { ask, bid, both }

enum OrderBookPresentationConfiguration { horizontal, vertical }

enum OrderBookRound { x001, x01, x1, x10, x50, x100 }

extension OrderBookRoundExtension on OrderBookRound {
  String getName() {
    switch (this) {
      case OrderBookRound.x001:
        return '0.01';
      case OrderBookRound.x01:
        return '0.1';
      case OrderBookRound.x1:
        return '1';
      case OrderBookRound.x10:
        return '10';
      case OrderBookRound.x50:
        return '50';
      case OrderBookRound.x100:
        return '100';
    }
  }

  Decimal getStep() {
    switch (this) {
      case OrderBookRound.x001:
        return Decimal.parse('0.01');
      case OrderBookRound.x01:
        return Decimal.parse('0.1');
      case OrderBookRound.x1:
        return Decimal.parse('1');
      case OrderBookRound.x10:
        return Decimal.parse('10');
      case OrderBookRound.x50:
        return Decimal.parse('50');
      case OrderBookRound.x100:
        return Decimal.parse('100');
    }
  }
}

const uuid = Uuid();

Decimal changePrice(OrderBookChangeEntity change) =>
    Decimal.tryParse('${change.price!}') ?? Decimal.zero;
Decimal changeQuantity(OrderBookChangeEntity change) =>
    Decimal.tryParse('${change.amount!}') ?? Decimal.zero;
Decimal askBidPrice(OrderBookAskBidEntity askBid) =>
    Decimal.tryParse('${askBid.price!}') ?? Decimal.zero;
Decimal askBidQuantity(OrderBookAskBidEntity askBid) =>
    Decimal.tryParse('${askBid.quantity!}') ?? Decimal.zero;

class OrderBookData {
  int timeStamp = 0;

  final Map<Decimal, int> askPriceTime;
  final Map<Decimal, Decimal> askPriceQuantity;
  final Map<Decimal, int> bidPriceTime;
  final Map<Decimal, Decimal> bidPriceQuantity;
  final Map<Decimal, DateTime> askPriceUpdateTime;
  final Map<Decimal, DateTime> bidPriceUpdateTime;

  OrderBookData({
    required this.askPriceTime,
    required this.askPriceQuantity,
    required this.bidPriceTime,
    required this.bidPriceQuantity,
    required this.timeStamp,
    required this.askPriceUpdateTime,
    required this.bidPriceUpdateTime,
  });

  OrderBookData.empty():askPriceTime= {}, askPriceQuantity= {}, bidPriceTime= {},  askPriceUpdateTime= {},  bidPriceUpdateTime= {}, bidPriceQuantity= {}, timeStamp= 0;
  
}

class OrderBookTileData {
  OrderBookTileData({
    required this.updateTime,
    required this.price,
    required this.quantity,
    required this.total,
  });

  final DateTime updateTime;
  final double price;
  final double quantity;
  final double total;
}

class OrderBookTileConfig {
  final OrderBookStaircaseType type;
  final OrderBookCrossAxisAlignment aligement;
  final OrderBookPresentationConfiguration configuration;

  OrderBookTileConfig({
    required this.type,
    required this.aligement,
    required this.configuration, 
  });
}

class OrderBookViewData {
  final double currentPrice;
  final double currentPriceChange;

  final List<OrderBookTileData> asks;
  final List<OrderBookTileData> bids;

  OrderBookViewData({
    required this.currentPrice,
    required this.currentPriceChange,
    required this.asks,
    required this.bids,
  });
}
