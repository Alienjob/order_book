import 'package:decimal/decimal.dart';

import 'model.dart';
import '/entities/buy_sell.dart';
import '/entities/order_book_change_entity.dart';

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
      Decimal result = quantity - (quantityStore[price] ?? Decimal.zero);
      if (quantity == Decimal.zero) {
        result = -(quantityStore[price] ?? Decimal.zero);
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
