import 'dart:convert';

List<QuotesModel> quotesModelFromJson(String str) => List<QuotesModel>.from(json.decode(str).map((x) => QuotesModel.fromJson(x)));

String quotesModelToJson(List<QuotesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotesModel {
    String q;
    String a;
    String c;
    String h;

    QuotesModel({
        required this.q,
        required this.a,
        required this.c,
        required this.h,
    });

    factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        q: json["q"],
        a: json["a"],
        c: json["c"],
        h: json["h"],
    );

    Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
        "c": c,
        "h": h,
    };
}
