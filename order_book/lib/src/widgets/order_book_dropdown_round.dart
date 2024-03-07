import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_book/order_book.dart';
import 'package:order_book/src/bloc/order_book_bloc.dart';
//import 'package:a4/app/widgets/inputs/drop_down_input.dart';

class DropDownRound extends StatelessWidget {
  const DropDownRound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: BlocBuilder<OrderBookBloc, OrderBookState>(
        builder: (context, state) {
          return DropdownButton(
            items: OrderBookRound.values
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.getName()),
                    ))
                .toList(),
            value: OrderBookRound.values[0],
            onChanged: (OrderBookRound? value) {
              if (value != null) {
                final bloc = BlocProvider.of<OrderBookBloc>(context);
                bloc.add(OrderBookEvent.roundChanged(round: value));
              }
            },
          );
        },
      ),
    );
  }
}
