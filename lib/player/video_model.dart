import 'dart:convert';

VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
    String id;
    int views;
    int duration;
    DateTime published;
    int num;
    bool underscore;

    VideoModel({
        required this.id,
        required this.views,
        required this.duration,
        required this.published,
        required this.num,
        required this.underscore,
    });

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        views: json["views"],
        duration: json["duration"],
        published: DateTime.parse(json["published"]),
        num: json["num"],
        underscore: json["underscore"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "views": views,
        "duration": duration,
        "published": published.toIso8601String(),
        "num": num,
        "underscore": underscore,
    };
}
