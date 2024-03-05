
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_book/src/bloc/order_book_bloc.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/widgets/order_book_control_widget.dart';
import 'package:order_book/src/widgets/order_book_current_price_widget.dart';
import 'package:order_book/src/widgets/order_book_staircase_widget.dart';

class OrderBookRootWidget extends StatelessWidget {
  const OrderBookRootWidget({
    super.key,
    required this.configuration,
  });
  final OrderBookPresentationConfiguration configuration;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBookBloc, OrderBookState>(
        builder: (context, state) {
      List<OrderBookTileData> asks = state.orderBook?.asks ?? [];
      List<OrderBookTileData> bids = state.orderBook?.bids ?? [];
      final bool showBid = !(bids.isEmpty ||
          (state.control?.section == OrderBookPresentationSection.ask));
      final bool showAsk = !(asks.isEmpty ||
          (state.control?.section == OrderBookPresentationSection.bid));

      if (configuration == OrderBookPresentationConfiguration.horizontal) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, top: 12, bottom: 12),
              child: OrderBookControlWidget(configuration: configuration),
            ),
            const Divider(height: 2),
            const OrderBookCurrentPriceWidget(),
            const Divider(height: 2),
            Expanded(
              child: Row(
                children: [
                  if (showBid)
                    OrderBookStaircaseWidget(
                      type: OrderBookStaircaseType.bid,
                      aligement: OrderBookCrossAxisAlignment.right,
                      sort: OrderBookMainAxisSort.asc,
                      data: bids,
                      configuration: configuration,
                    ),
                  if (showAsk)
                    OrderBookStaircaseWidget(
                      type: OrderBookStaircaseType.ask,
                      aligement: OrderBookCrossAxisAlignment.left,
                      sort: OrderBookMainAxisSort.desc,
                      data: asks,
                      configuration: configuration,
                    ),
                ],
              ),
            ),
          ],
        );
      } else {
        //if (configuration == OrderBookPresentationConfiguration.vertical)
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, top: 12, bottom: 12),
              child: OrderBookControlWidget(configuration: configuration),
            ),
            const Divider(height: 2),
            if (showAsk)
              OrderBookStaircaseWidget(
                type: OrderBookStaircaseType.ask,
                aligement: OrderBookCrossAxisAlignment.right,
                sort: OrderBookMainAxisSort.asc,
                data: asks,
                configuration: configuration,
              ),
            const Divider(height: 2),
            const OrderBookCurrentPriceWidget(),
            const Divider(height: 2),
            if (showBid)
              OrderBookStaircaseWidget(
                type: OrderBookStaircaseType.bid,
                aligement: OrderBookCrossAxisAlignment.right,
                sort: OrderBookMainAxisSort.desc,
                data: bids,
                configuration: configuration,
              ),
          ],
        );
      }
    });
  }
}
