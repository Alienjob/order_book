
import 'package:either_dart/either.dart';
import 'package:order_book/src/entities/order_book_entity.dart';
import 'package:order_book/src/entities/socket_responce.dart';

class BinanceApi {
  void send(String message) {}
  Stream<SocketResponse> subject = const Stream.empty();
  //GET /api/v3/depth
  Future<Either<OrderBookEntity, String>> getOrderBook({int? marketId, required int limit, required int offset})async  {
    return Right('asd');
  }
}

