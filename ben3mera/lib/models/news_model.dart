// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    this.id,
    this.name,
    this.description,
    this.commentsCount,
    this.shareCount,
    this.file,
  });

  int id;
  String name;
  String description;
  int commentsCount;
  int shareCount;
  String file;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    commentsCount: json["comments_count"],
    shareCount: json["share_count"],
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "comments_count": commentsCount,
    "share_count": shareCount,
    "file": file,
  };
}
