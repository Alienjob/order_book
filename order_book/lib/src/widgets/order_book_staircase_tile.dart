import 'dart:math';

import 'package:flutter/material.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/service/staircase_data_store.dart';
import 'package:order_book/src/service/style.dart';
import 'package:order_book/src/widgets/order_book_quantity_animator.dart';
import 'package:order_book/src/widgets/order_book_quantity_indicator.dart';

import 'package:visiblity_data_manager/visiblity_data_manager.dart';

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

  double _changedIndicator() {
    return (data.updateTime
            .add(OrderBookStyle.changedIndicationDuration)
            .isAfter(DateTime.now()))
        ? 1
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final avalable = constraints.maxWidth;

        return Stack(
          children: [
            OrderBookQuantityIndicator(
              aligement: aligement,
              width: _changedIndicator()*avalable,
              indicatorColor: _indicatorColor(),
            ),
            VisiblityManageble(
              key: ValueKey(data.price),
              initValue: data,
              builder: () {
                double maxTotal = data.total;
                var notificator = VisiblityNotificator.of(context);
                final store = notificator.store;
                if (store is StaircaseDataStore) {
                  maxTotal = store.data?.maxTotal??data.total;
                }
                final width =  min(avalable * data.total / maxTotal,avalable);
                return OrderBookQuantityAnimator(
                  child: OrderBookQuantityIndicator(
                      aligement: aligement,
                      width: width,
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
                        TileQuantity(quantity: (data.total*10000).roundToDouble()/10000)
                      ])
                    : ([
                        TileQuantity(quantity: (data.total*10000).roundToDouble()/10000),
                        const Spacer(),
                        TilePrice(
                            price: data.price.toDouble(), color: _priceColor())
                      ])
              ],
            ),
          ],
        );
      }
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
