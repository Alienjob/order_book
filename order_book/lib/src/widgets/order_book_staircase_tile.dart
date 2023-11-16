import 'package:flutter/material.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/service/staircase_data_store.dart';
import 'package:order_book/src/service/style.dart';
import 'package:order_book/src/widgets/order_book_quantity_animator.dart';
import 'package:order_book/src/widgets/order_book_quantity_indicator.dart';
import 'package:order_book/src/widgets/order_book_quantity_indicator_manageble.dart';
import 'package:visiblity_manager/visiblity_manager.dart';

class OrderBookStaircaseTile extends StatelessWidget {
  const OrderBookStaircaseTile({
    super.key,
    required this.data,
    required this.type,
    required this.aligement,
  });

  final OrderBookStaircaseType type;
  final OrderBookCrossAxisAlignment aligement;

  final OrderBookTileData data;

  Color _indicatorColor() {
    return (type == OrderBookStaircaseType.ask)
        ? OrderBookStyle.askBackgroundColor
        : OrderBookStyle.bidBackgroundColor;
  }

  Color _priceColor() {
    return (type == OrderBookStaircaseType.ask)
        ? OrderBookStyle.askColor
        : OrderBookStyle.bidColor;
  }

  int _changedIndicator() {
    return (data.updateTime
            .add(OrderBookStyle.changedIndicationDuration)
            .isAfter(DateTime.now()))
        ? 1
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OrderBookQuantityIndicator(
          aligement: aligement,
          flexData: _changedIndicator(),
          flexTransparent: 1 - _changedIndicator(),
          indicatorColor: _indicatorColor(),
        ),
        VisiblityManageble(
          key: ValueKey(data.price),
          builder: () {
            double maxTotal = data.total;
            int flexTransparent = 1;
            int flexData = 1;
            var notificator = VisiblityNotificator.of(context);
            final store = notificator.store;
            if (store is StaircaseDataStore) {
              maxTotal = store.data?.maxTotal??data.total;
              flexTransparent = 1;
              flexData = 1;
            }
            return OrderBookQuantityAnimator(
              child: OrderBookQuantityIndicator(
                  aligement: aligement,
                  flexTransparent: flexTransparent,
                  flexData: flexData,
                  indicatorColor: _indicatorColor()),
            );
          },
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: OrderBookStyle.cellHeight),
            ...(aligement == OrderBookCrossAxisAlignment.left)
                ? ([
                    TilePrice(
                        price: data.price.toDouble(), color: _priceColor()),
                    const Spacer(),
                    TileQuantity(quantity: data.quantity.toDouble())
                  ])
                : ([
                    TileQuantity(quantity: data.quantity.toDouble()),
                    const Spacer(),
                    TilePrice(
                        price: data.price.toDouble(), color: _priceColor())
                  ])
          ],
        ),
      ],
    );
  }
}

class TileQuantity extends StatelessWidget {
  const TileQuantity({
    super.key,
    required this.quantity,
  });

  final double? quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text('$quantity', style: OrderBookStyle.txtTileWhite),
    );
  }
}

class TilePrice extends StatelessWidget {
  const TilePrice({
    super.key,
    required this.price,
    required this.color,
  });

  final double? price;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text('$price',
          style: OrderBookStyle.txtTileWhite.copyWith(color: color)),
    );
  }
}
