
import 'package:flutter/material.dart';
import '../domain/model.dart';
import '../service/style.dart';


class OrderBookQuantityIndicator extends StatelessWidget {
  const OrderBookQuantityIndicator({
    super.key,
    required this.aligement,
    required this.width,
    required this.indicatorColor,
  });

  final OrderBookCrossAxisAlignment aligement;
  final double width;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: (aligement == OrderBookCrossAxisAlignment.right)?MainAxisAlignment.end:MainAxisAlignment.start,
          children: [
            Container(
              width: width,
              color: indicatorColor,
              height: OrderBookStyle.cellHeight,
            ),
          ],
        );
      }
    );
  }
}
