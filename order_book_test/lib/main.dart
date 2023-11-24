import 'package:flutter/material.dart';
import 'package:order_book_test/pages/binance_page.dart';
import 'package:order_book_test/pages/mock_page.dart';

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
  bool _useMock = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_useMock?'Mock repository':'Binance repository'),
        actions: [
          Switch(
            value: _useMock,
            onChanged: (_) => setState(() {
              _useMock = !_useMock;
            }),
          )
        ],
      ),
      body: _useMock ? const MockPage() : const BinancePage(),
    );
  }
}
