import 'package:flutter/material.dart';
import 'package:order_book/order_book.dart';

class OrderBookPage extends StatefulWidget {
  const OrderBookPage({super.key, required this.repository});

  final IOrderBookRepository repository;

  @override
  State<OrderBookPage> createState() => _OrderBookPageState();
}

class _OrderBookPageState extends State<OrderBookPage> {
  @override
  Widget build(BuildContext context) {
    const configuration = OrderBookPresentationConfiguration.horizontal;
    return Column(
      children: [
        Expanded(
          child: OrderBookWidget(
            configuration: configuration,
            repository: widget.repository,
          ),
        ),
      ],
    );
  }
}
