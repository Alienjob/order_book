import 'package:decimal/decimal.dart';

import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/entities/buy_sell.dart';
import 'package:order_book/src/entities/order_book_change_entity.dart';

class OrderBook {
  OrderBookData data;

  OrderBook(this.data);

  // возвращает изменение объема,
  // чтобы вью могла обновить суммировнную запись
  Decimal update(OrderBookChangeEntity change) {
    int timestamp = change.timestamp ?? 0;

    Decimal price = changePrice(change);
    Decimal quantity = changeQuantity(change);

    data.timeStamp = timestamp;

    final quantityStore = (change.side == BuySell.buy)
        ? data.bidPriceQuantity
        : data.askPriceQuantity;
    final timeStore =
        (change.side == BuySell.buy) ? data.bidPriceTime : data.askPriceTime;

    if ((timeStore[price] == null) || (timeStore[price]! < (timestamp))) {
      final result = quantity - (quantityStore[price] ?? Decimal.zero);
      if (quantity == Decimal.zero) {
        quantityStore.remove(price);
      } else {
        quantityStore[price] = quantity;
        timeStore[price] = timestamp;
      }

      return result;
    } else {
      return Decimal.zero;
    }
  }
}
