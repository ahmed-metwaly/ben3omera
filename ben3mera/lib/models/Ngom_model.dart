// To parse this JSON data, do
//
//     final ngomModel = ngomModelFromJson(jsonString);

import 'dart:convert';

NgomModel ngomModelFromJson(String str) => NgomModel.fromJson(json.decode(str));

String ngomModelToJson(NgomModel data) => json.encode(data.toJson());

class NgomModel {
  NgomModel({
    this.isNow,
    this.data,
  });

  int isNow;
  List<Datum> data;

  factory NgomModel.fromJson(Map<String, dynamic> json) => NgomModel(
    isNow: json["is_now"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "is_now": isNow,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.name,
    this.text,
    this.startDate,
    this.endDate,
    this.hijriEnd,
    this.hijriStart,
    this.dateCalc,
  });


  String name;
  String text;
  String startDate;
  String endDate;
  String hijriEnd;
  String hijriStart;
  int dateCalc;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(

    name: json["name"],
    text: json["text"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    hijriEnd: json["hijri_end"],
    hijriStart: json["hijri_start"],
    dateCalc: json["date_calc"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "text": text,
    "start_date": startDate,
    "end_date": endDate,
    "hijri_end": hijriEnd,
    "hijri_start": hijriStart,
    "date_calc": dateCalc,
  };
}
