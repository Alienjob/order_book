import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/market_list_repository.dart';
import '../domain/model.dart';

part 'market_list_state.dart';
part 'market_list_event.dart';
part 'market_list_bloc.freezed.dart';

class MarketListBloc extends Bloc<MarketListEvent, MarketListState> {
  MarketListBloc({required this.repository}) : super(MarketListState());

  final IMarketListRepository repository;
}
