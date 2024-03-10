
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



import '../bloc/order_book_bloc.dart';
import '../service/style.dart';

class OrderBookCurrentPriceWidget extends StatelessWidget {
  const OrderBookCurrentPriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBookBloc, OrderBookState>(
      builder: (context, state) {
        final bool decrease = ((state.currentPrice?.change ?? 0) < 0);
        final price = '${state.currentPrice?.price ?? '...'}';
        final usd =
            '${String.fromCharCode(0x2248)} ${state.currentPrice?.priceUSD.toStringAsFixed(1) ?? '...'}  USD';
        final changeAbsolute =
            state.currentPrice?.change.toStringAsFixed(5) ?? '...';
        final changePercent =
            '${state.currentPrice?.changePercent.toStringAsFixed(3) ?? '...'} %';
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Text(
                    price,
                    style: OrderBookStyle.txtCurrentPricePrimary.copyWith(
                      color: decrease?OrderBookStyle.askColor:OrderBookStyle.bidColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  RotatedBox(
                    quarterTurns: decrease?2:0,
                    child: const Icon(Icons.arrow_upward),
                  ),
                ]),
                Row(children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text(changePercent,
                        style: OrderBookStyle.txtTileWhite.copyWith(
                          color: decrease?OrderBookStyle.askColor:OrderBookStyle.bidColor,
                        ))
                  ])
                ])
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(usd, style: OrderBookStyle.txtCurrentPriceAdditional),
                  Text(changeAbsolute,
                      style: OrderBookStyle.txtCurrentPriceAdditional),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
