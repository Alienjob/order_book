import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_book/src/domain/model.dart';
import 'package:order_book/src/domain/order_book_control.dart';
import 'package:order_book/src/domain/order_book_current_price.dart';
import 'package:order_book/src/entities/market_price_entity.dart';
import 'package:order_book/src/service/order_book_repository.dart';


part 'order_book_state.dart';

part 'order_book_event.dart';

part 'order_book_bloc.freezed.dart';

class OrderBookBloc extends Bloc<OrderBookEvent, OrderBookState> {
  MarketPriceEntity market;
  final IOrderBookRepository repository;

  StreamSubscription<OrderBookViewData>? _listener;

  OrderBookBloc({required this.repository, required this.market})
      : super(OrderBookState()) {
    on<Init>(_init);
    on<DataRecieved>(_dataRecieved);

    on<RoundChanged>(_roundChanged);
    on<PresentationSectionChanged>(_presentationSectionChanged);
    on<ListeningChanged>(_listeningChanged);

    add(const Init());
  }

  FutureOr<void> _init(Init event, Emitter<OrderBookState> emit) async {
    emit(state.copyWith(
        market: market,
        control: const OrderBookControl(
            section: OrderBookPresentationSection.both,
            round: OrderBookRound.x001,
            listening: true)));
    await repository.init(market: market);
    repository.setRound(OrderBookRound.x001);
    _connectRepository(emit);
  }

  FutureOr<void> _dataRecieved(
      DataRecieved event, Emitter<OrderBookState> emit) async {
    emit(state.copyWith(
      orderBook: event.data,
      currentPrice: OrderBookCurrentPrice(
        price: event.data.currentPrice,
        priceUSD: event.data.currentPrice,
        change: event.data.currentPriceChange,
        changePercent: _percent(event.data.currentPriceChange, event.data.currentPrice),
      ),
    ));
  }

  FutureOr<void> _roundChanged(
      RoundChanged event, Emitter<OrderBookState> emit) async {
    repository.setRound(event.round);
    emit(state.copyWith(control: state.control!.copyWith(round: event.round)));
  }

  FutureOr<void> _presentationSectionChanged(
      PresentationSectionChanged event, Emitter<OrderBookState> emit) async {
    emit(state.copyWith(
        control: state.control!.copyWith(section: event.presentationSection)));
  }

  FutureOr<void> _listeningChanged(
      ListeningChanged event, Emitter<OrderBookState> emit) async {
    await repository.setListening(event.listening);
    emit(state.copyWith(
        control: state.control!.copyWith(listening: event.listening)));
  }

  void _connectRepository(Emitter<OrderBookState> emit) {
    _listener = repository.stream.listen((response) {
      add(OrderBookEvent.dataRecieved(data: response));
    });

    repository.init(market: market);
  }

  @override
  Future<void> close() {
    _listener?.cancel();
    repository.dispose();
    return super.close();
  }

  double _percent(double vol, double base) {
    if (base == 0) return 100;
    return vol * 100 / base;
  }
}
