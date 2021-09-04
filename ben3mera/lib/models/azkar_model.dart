// To parse this JSON data, do
//
//     final azkarModel = azkarModelFromJson(jsonString);

import 'dart:convert';

List<AzkarModel> azkarModelFromJson(String str) => List<AzkarModel>.from(json.decode(str).map((x) => AzkarModel.fromJson(x)));

String azkarModelToJson(List<AzkarModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AzkarModel {
  AzkarModel({
    this.id,
    this.title,
    this.text,
    this.video,
  });

  int id;
  String title;
  String text;
  String video;

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
    id: json["id"],
    title: json["title"],
    text: json["text"],
    video: json["video"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "text": text,
    "video": video,
  };
}
