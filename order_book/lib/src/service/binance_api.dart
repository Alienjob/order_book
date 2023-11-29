import 'dart:async';
import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:order_book/src/entities/binance_depth_response.dart';
import 'package:order_book/src/entities/order_book_askbid_response.dart';
import 'package:order_book/src/entities/order_book_entity.dart';
import 'package:order_book/src/entities/order_book_response.dart';
import 'package:order_book/src/entities/socket_responce.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'binance_api.g.dart';
 


class BinanceApi {
  WebSocketChannel? _channel;
  final restClient = BinanceRestClient(Dio());
  BinanceApi();

  void openDepth({required String symbol}) {
    final socketUrl = 'wss://stream.binance.com:9443/ws/$symbol@depth';

    close();
    _channel = WebSocketChannel.connect(Uri.parse(socketUrl));
    _channel?.stream.listen((message) {
      _controller.add(SocketResponse(
        isStart: false,
        data: jsonDecode(message),
      ));
    });
  }

  void close() {
    _channel?.sink.close(status.goingAway);
  }

  void send(String message) {}

  final StreamController<SocketResponse> _controller =
      StreamController<SocketResponse>();
  Stream<SocketResponse> get subject => _controller.stream;

  Future<Either<OrderBookEntity, String>> getOrderBook(
      {required String symbol}) async {
    try {
      final binanceResponse = await restClient.getDepth(symbol.toUpperCase());
      final orderBookResponse =  OrderBookResponse(
          asks: binanceResponse.asks.map((e) => OrderBookAskBidResponse(
            price: double.tryParse(e[0])??0,
            quantity: double.tryParse(e[1])??0,
          )).toList(),
          bids: binanceResponse.bids.map((e) => OrderBookAskBidResponse(
            price: double.tryParse(e[0])??0,
            quantity: double.tryParse(e[1])??0,
          )).toList(),
          timestamp: binanceResponse.lastUpdateId
         );
      return Left(OrderBookEntity.fromResponse(orderBookResponse)) ;
    } catch (e) {
      return const Right('Error while parsing BiniaceDepthResponse');  
    }
    
  }
}



@RestApi(baseUrl: 'https://api.binance.com/api/v3/')
abstract class BinanceRestClient {
  factory BinanceRestClient(Dio dio, {String baseUrl}) = _BinanceRestClient;

  @GET('depth?symbol={symbol}&limit=1000')
  Future<BiniaceDepthResponse> getDepth(@Path('symbol') String symbol);
}
