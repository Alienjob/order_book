import 'dart:convert';

BiniaceDepthResponse biniaceDepthResponseFromJson(String str) => BiniaceDepthResponse.fromJson(json.decode(str));

String biniaceDepthResponseToJson(BiniaceDepthResponse data) => json.encode(data.toJson());

class BiniaceDepthResponse {
    final int lastUpdateId;
    final List<List<String>> bids;
    final List<List<String>> asks;

    BiniaceDepthResponse({
        required this.lastUpdateId,
        required this.bids,
        required this.asks,
    });

    factory BiniaceDepthResponse.fromJson(Map<String, dynamic> json) => BiniaceDepthResponse(
        lastUpdateId: json["lastUpdateId"],
        bids: List<List<String>>.from(json["bids"].map((x) => List<String>.from(x.map((x) => x)))),
        asks: List<List<String>>.from(json["asks"].map((x) => List<String>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toJson() => {
        "lastUpdateId": lastUpdateId,
        "bids": List<dynamic>.from(bids.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "asks": List<dynamic>.from(asks.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}
