import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/order_book_bloc.dart';




class OrderBookListeningControlButton extends StatelessWidget {
  const OrderBookListeningControlButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBookBloc, OrderBookState>(
      builder: (context, state) {
        final bool listening = state.control?.listening ?? true;

        return IconButton(
          icon: const Icon(Icons.pause, size: 16,),
          onPressed: () {
            final bloc = BlocProvider.of<OrderBookBloc>(context);
            bloc.add(OrderBookEvent.listeningChanged(listening:!listening));
          },
            color: listening
                ? Colors.grey
                : Colors.amber,
          
        );
      },
    );
  }
}
