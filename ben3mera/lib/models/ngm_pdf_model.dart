// To parse this JSON data, do
//
//     final ngmPdfModel = ngmPdfModelFromJson(jsonString);

import 'dart:convert';

List<NgmPdfModel> ngmPdfModelFromJson(String str) => List<NgmPdfModel>.from(json.decode(str).map((x) => NgmPdfModel.fromJson(x)));

String ngmPdfModelToJson(List<NgmPdfModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NgmPdfModel {
  NgmPdfModel({
    this.path,
  });

  String path;

  factory NgmPdfModel.fromJson(Map<String, dynamic> json) => NgmPdfModel(
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
  };
}
