import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return Placeholder(fallbackHeight: 16,);
          // return DropDownInput(
          //   needSpacer: false,
          //   showBorder: false,
          //   fontSize: 12,
          //   customPadding: const EdgeInsets.fromLTRB(6, 4, 6, 2),
          //   customBorderRadius: BorderRadius.circular(6),
          //   selectedIndex: OrderBookRound.values
          //       .indexOf(state.control?.round ?? OrderBookRound.x001),
          //   items: OrderBookRound.values.map((e) => e.getName()).toList(),
          //   onChange: (index) {
          //     final bloc = BlocProvider.of<OrderBookBloc>(context);
          //     bloc.add(OrderBookEvent.roundChanged(
          //         round: OrderBookRound.values[index]));
          //   },
          // );
        },
      ),
    );
  }
}
