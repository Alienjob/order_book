import 'package:flutter/material.dart';
import 'package:order_book_test/pages/binance_order_book_page.dart';
import 'package:order_book_test/pages/mock_order_book_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'binanse connect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexBottomNavbar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text((indexBottomNavbar == 0) ? 'Mock repository' : 'Binance repository'),
      ),
      body: (indexBottomNavbar == 0) ? const MockOrderBookPage() : const BinanceOrderBookPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        onTap: (value) {
          setState(() {
            indexBottomNavbar = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shuffle),
            label: 'Mock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: 'Binance',
          ),
        ],
      ),
    );
  }
}
