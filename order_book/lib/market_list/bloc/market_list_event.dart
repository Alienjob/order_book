part of 'market_list_bloc.dart';

@freezed
class MarketListEvent with _$MarketListEvent {
  const factory MarketListEvent.init() = Init;  
  const factory MarketListEvent.dataRecieved({required MarketList data}) = DataRecieved;
}
