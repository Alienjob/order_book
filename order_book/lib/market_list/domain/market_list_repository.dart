import '../../entities/market_price_entity.dart';

abstract class IMarketListRepository {
  
  late List<MarketPriceEntity> marketList;
  bool ready = false;
  
  Future<void> init() async {

  }
  
}
