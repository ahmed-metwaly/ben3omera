// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromJson(jsonString);

import 'dart:convert';

List<CommentsModel> commentsModelFromJson(String str) =>
    List<CommentsModel>.from(
        json.decode(str).map((x) => CommentsModel.fromJson(x)));

String commentsModelToJson(List<CommentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentsModel {
  CommentsModel({
    this.userName,
    this.comment,
    this.createdAt,
  });

  String userName;
  String comment;
  String createdAt;

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        userName: json["user_name"],
        comment: json["comment"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "comment": comment,
        "created_at": createdAt,
      };
}
