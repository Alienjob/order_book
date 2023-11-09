import 'package:flutter/material.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/service/style.dart';


class OrderBookQuantityIndicator extends StatelessWidget {
  const OrderBookQuantityIndicator({
    super.key,
    required this.aligement,
    required this.flexTransparent,
    required this.flexData,
    required this.indicatorColor,
  });

  final OrderBookCrossAxisAlignment aligement;
  final int flexTransparent;
  final int flexData;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (aligement == OrderBookCrossAxisAlignment.right)
          Expanded(
            flex: flexTransparent,
            //flex: (indicatorColor ==AppColors.green1)?flexData:flexTransparent,
            child: Container(),
          ),
        Expanded(
          flex: flexData,
          //flex: (indicatorColor == AppColors.green1)?flexTransparent:flexData,
          child: Container(
            color: indicatorColor,
            height: OrderBookStyle.cellHeight,
          ),
        ),
        if (aligement == OrderBookCrossAxisAlignment.left)
          Expanded(
            flex: flexTransparent,
            //flex: (indicatorColor == AppColors.green1)?flexData:flexTransparent,
            child: Container(),
          ),
      ],
    );
  }
}
