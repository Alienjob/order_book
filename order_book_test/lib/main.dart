import 'package:flutter/material.dart';
import 'package:order_book/order_book.dart';

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
      home: const MyHomePage(title: 'binanse connect'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _useMock = true;
  @override
  Widget build(BuildContext context) {
    const configuration = OrderBookPresentationConfiguration.horizontal;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Switch(
            value: _useMock,
            onChanged: (_) => setState(() {
              _useMock = !_useMock;
            }),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: OrderBookWidget(
                configuration: configuration,
                 repository: MockRepository(),
               ),
          ),
        ],
      )
      // _useMock
      //     ? OrderBookWidget(
      //         configuration: configuration,
      //         repository: MockRepository(),
      //       )
      //     : OrderBookWidget(
      //         configuration: configuration,
      //         repository: BinanceRepository(),
      //       ),
    );
  }
}
