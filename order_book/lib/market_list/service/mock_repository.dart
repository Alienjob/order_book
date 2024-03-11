import 'dart:async';

import '../domain/market_list_repository.dart';

import '/entities/socket_responce.dart';

class MockMarketListRepository extends IMarketListRepository {
  final StreamController<SocketResponse> mockStreamController =
      StreamController<SocketResponse>();

  @override
  Future<void> init() async {
    ready = true;
  }
}
