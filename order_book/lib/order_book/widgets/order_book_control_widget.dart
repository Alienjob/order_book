import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/order_book_bloc.dart';
import '../domain/model.dart';
import 'order_book_dropdown_round.dart';
import 'order_book_listening_control_button.dart';
import 'order_book_visible_control.dart';



class OrderBookControlWidget extends StatelessWidget {
  const OrderBookControlWidget({Key? key, required this.configuration}) : super(key: key);

  final OrderBookPresentationConfiguration configuration;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBookBloc, OrderBookState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                BothVisibleButton(configuration: configuration),
                const SizedBox(width: 5),
                const BidVisibleButton(),
                const SizedBox(width: 5),
                const AskVisibleButton(),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DropDownRound(),
                SizedBox(
                  width: 6,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: OrderBookListeningControlButton(),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
