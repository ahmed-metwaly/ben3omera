// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.initialPage,
    this.data,
  });

  int initialPage;
  List<Datum> data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    initialPage: json["initial_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "initial_page": initialPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.gYear,
    this.gMonth,
    this.gDay,
    this.hYear,
    this.hMonth,
    this.hDay,
    this.dayString,
    this.season,
    this.ngmDay,
    this.ngmName,
    this.ngmDescription,
  });

  String gYear;
  String gMonth;
  int gDay;
  String hYear;
  String hMonth;
  int hDay;
  String dayString;
  String season;
  int ngmDay;
  String ngmName;
  String ngmDescription;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    gYear: json["g_year"],
    gMonth: json["g_month"],
    gDay: json["g_day"],
    hYear: json["h_year"],
    hMonth: json["h_month"],
    hDay: json["h_day"],
    dayString: json["day_string"],
    season : json["season"],
    ngmDay: json["ngm_day"],
    ngmName: json["ngm_name"],
    ngmDescription: json["ngm_description"],
  );

  Map<String, dynamic> toJson() => {
    "g_year": gYear,
    "g_month": gMonth,
    "g_day": gDay,
    "h_year": hYear,
    "h_month": hMonth,
    "h_day": hDay,
    "day_string": dayString,
    "season": season,
    "ngm_day": ngmDay,
    "ngm_name": ngmName,
    "ngm_description": ngmDescription,
  };
}
