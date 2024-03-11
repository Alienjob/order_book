import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/market_list_bloc.dart';
import 'domain/market_list_repository.dart';

class MarketListWidget extends StatelessWidget {
  const MarketListWidget({super.key, required this.repository});
  final IMarketListRepository repository;
  @override
  Widget build(BuildContext context) {
    return MarketListBlocWrapper(repository: repository,
    child: const Placeholder());
  }
}

class MarketListBlocWrapper extends StatelessWidget {
  const MarketListBlocWrapper(
      {Key? key, required this.child, required this.repository})
      : super(key: key);
  final Widget child;
  final IMarketListRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketListBloc(
          repository: repository),
      child: child,
    );
  }
}
