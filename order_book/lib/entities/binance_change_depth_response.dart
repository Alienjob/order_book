
import 'dart:convert';

BiniaceChangeDepthResponse biniaceChangeDepthResponseFromJson(String str) => BiniaceChangeDepthResponse.fromJson(json.decode(str));

String biniaceChangeDepthResponseToJson(BiniaceChangeDepthResponse data) => json.encode(data.toJson());

class BiniaceChangeDepthResponse {
    final String biniaceChangeDepthResponseE;
    final int e;
    final String s;
    final int u;
    final int U;
    final List<List<String>> b;
    final List<List<String>> a;

    BiniaceChangeDepthResponse({
        required this.biniaceChangeDepthResponseE,
        required this.e,
        required this.s,
        required this.u,
        required this.U,
        required this.b,
        required this.a,
    });

    factory BiniaceChangeDepthResponse.fromJson(Map<String, dynamic> json) => BiniaceChangeDepthResponse(
        biniaceChangeDepthResponseE: json["e"],
        e: json["E"],
        s: json["s"],
        u: json["u"],
        U: json["U"],
        b: List<List<String>>.from(json["b"].map((x) => List<String>.from(x.map((x) => x)))),
        a: List<List<String>>.from(json["a"].map((x) => List<String>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toJson() => {
        "e": biniaceChangeDepthResponseE,
        "E": e,
        "s": s,
        "U": U,
        "u": u,
        "b": List<dynamic>.from(b.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "a": List<dynamic>.from(a.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}
