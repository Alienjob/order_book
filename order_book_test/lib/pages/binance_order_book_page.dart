import 'package:flutter/material.dart';
import 'package:order_book/order_book.dart';
import 'package:order_book_test/pages/order_book_page.dart';

class BinanceOrderBookPage extends StatelessWidget {
  const BinanceOrderBookPage({super.key});


  @override
  Widget build(BuildContext context) {
    return OrderBookPage(repository: BinanceRepository());
  }
}
