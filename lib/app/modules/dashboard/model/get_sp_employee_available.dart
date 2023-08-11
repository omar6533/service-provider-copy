// To parse this JSON data, do
//
//     final getSpEmployeeAvailableForToDay = getSpEmployeeAvailableForToDayFromJson(jsonString);

import 'dart:convert';

GetSpEmployeeAvailableForToDay getSpEmployeeAvailableForToDayFromJson(
        String str) =>
    GetSpEmployeeAvailableForToDay.fromJson(json.decode(str));

String getSpEmployeeAvailableForToDayToJson(
        GetSpEmployeeAvailableForToDay data) =>
    json.encode(data.toJson());

class GetSpEmployeeAvailableForToDay {
  bool? status;
  List<dynamic>? listBusyEmployee;
  List<dynamic>? listNonBusyEmployee;
  String? message;

  GetSpEmployeeAvailableForToDay({
    this.status,
    this.listBusyEmployee,
    this.listNonBusyEmployee,
    this.message,
  });

  factory GetSpEmployeeAvailableForToDay.fromJson(Map<String, dynamic> json) =>
      GetSpEmployeeAvailableForToDay(
        status: json["status"],
        listBusyEmployee: json["listBusyEmployee"] == null
            ? []
            : List<dynamic>.from(json["listBusyEmployee"]!.map((x) => x)),
        listNonBusyEmployee: json["listNonBusyEmployee"] == null
            ? []
            : List<dynamic>.from(json["listNonBusyEmployee"]!.map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "listBusyEmployee": listBusyEmployee == null
            ? []
            : List<dynamic>.from(listBusyEmployee!.map((x) => x)),
        "listNonBusyEmployee": listNonBusyEmployee == null
            ? []
            : List<dynamic>.from(listNonBusyEmployee!.map((x) => x)),
        "message": message,
      };
}
