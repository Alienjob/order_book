import 'package:flutter/material.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/service/style.dart';
import 'package:order_book/src/widgets/order_book_quantity_indicator.dart';
import 'package:order_book/src/widgets/order_book_quantity_indicator_manageble.dart';


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
        OrderBookQuantityIndicatorManageble(
          id: data.price,
          aligement: aligement,
          total: data.total,
          indicatorColor: _indicatorColor(),
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
