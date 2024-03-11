
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/order_book_bloc.dart';
import 'domain/model.dart';
import '/entities/market_price_entity.dart';
import 'service/order_book_repository.dart';
import 'widgets/order_book_root_widget.dart';


class OrderBookWidget extends StatelessWidget {
  const OrderBookWidget({Key? key, this.market, required this.configuration, required this.repository}) : super(key: key);

  final MarketPriceEntity? market;
  final OrderBookPresentationConfiguration configuration;
  final IOrderBookRepository repository;

  @override
  Widget build(BuildContext context) {
    return OrderBookBlocWrapper(
      market: market??repository.defaultMarket,
      repository: repository,
      child: OrderBookRootWidget(configuration : configuration),
    );
  }
}

class OrderBookBlocWrapper extends StatelessWidget {
  const OrderBookBlocWrapper(
      {Key? key, required this.child, required this.market, required this.repository})
      : super(key: key);
  final MarketPriceEntity market;
  final Widget child;
  final IOrderBookRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBookBloc(
          market: market,
          repository: repository),
      child: child,
    );
  }
}
