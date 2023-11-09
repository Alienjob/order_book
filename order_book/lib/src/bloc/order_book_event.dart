part of 'order_book_bloc.dart';

@freezed
class OrderBookEvent with _$OrderBookEvent {
  const factory OrderBookEvent.init() = Init;  
  const factory OrderBookEvent.dataRecieved({required OrderBookViewData data}) = DataRecieved;
  const factory OrderBookEvent.roundChanged({required OrderBookRound round}) = RoundChanged;
  const factory OrderBookEvent.presentationSectionChanged({
    required OrderBookPresentationSection presentationSection}) = PresentationSectionChanged;
  const factory OrderBookEvent.listeningChanged({
    required bool listening}) = ListeningChanged;

}
