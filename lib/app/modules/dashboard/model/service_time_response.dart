// To parse this JSON data, do
//
//     final serviceTimeSlotResponse = serviceTimeSlotResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/constant/extensions.dart';
import 'package:intl/intl.dart';

ServiceTimeSlotResponse serviceTimeSlotResponseFromJson(String str) =>
    ServiceTimeSlotResponse.fromJson(json.decode(str));

String serviceTimeSlotResponseToJson(ServiceTimeSlotResponse data) =>
    json.encode(data.toJson());

class ServiceTimeResult {
  int? serviceTimeSlotId;
  String? serviceTimeSlotStart;
  String? serviceTimeSlotEnd;
  bool? serviceTimeSlotIsActive;

  ServiceTimeResult({
    this.serviceTimeSlotId,
    this.serviceTimeSlotStart,
    this.serviceTimeSlotEnd,
    this.serviceTimeSlotIsActive,
  });

  factory ServiceTimeResult.fromJson(Map<String, dynamic> json) =>
      ServiceTimeResult(
        serviceTimeSlotId: json["serviceTimeSlotId"],
        serviceTimeSlotStart: json["serviceTimeSlotStart"],
        serviceTimeSlotEnd: json["serviceTimeSlotEnd"],
        serviceTimeSlotIsActive: json["serviceTimeSlotIsActive"],
      );
  String getEndTimeSlot() {
    try {
      DateTime dateTime =
          DateFormat("hh:mm:ss").parse(serviceTimeSlotEnd ?? '');
      return DateFormat('hh:mm a',
              isArabic ? arabicLocal.languageCode : englishLocal.languageCode)
          .format(dateTime);
    } catch (e) {
      return serviceTimeSlotEnd ?? '';
    }
  }

  String getStartTimeSlot() {
    try {
      DateTime dateTime =
          DateFormat("hh:mm:ss").parse(serviceTimeSlotStart ?? '');
      return DateFormat('hh:mm a',
              isArabic ? arabicLocal.languageCode : englishLocal.languageCode)
          .format(dateTime);
    } catch (e) {
      return serviceTimeSlotStart ?? '';
    }
  }

  String serviceTimeTitle() {
    return "${getStartTimeSlot()} - ${getEndTimeSlot()}";
  }

  Map<String, dynamic> toJson() => {
        "serviceTimeSlotId": serviceTimeSlotId,
        "serviceTimeSlotStart": serviceTimeSlotStart,
        "serviceTimeSlotEnd": serviceTimeSlotEnd,
        "serviceTimeSlotIsActive": serviceTimeSlotIsActive,
      };
}

class ServiceTimeSlotResponse {
  bool? status;
  List<ServiceTimeResult>? result;
  String? message;

  ServiceTimeSlotResponse({
    this.status,
    this.result,
    this.message,
  });

  factory ServiceTimeSlotResponse.fromJson(Map<String, dynamic> json) =>
      ServiceTimeSlotResponse(
        status: json["status"],
        result: json["result"] == null
            ? []
            : List<ServiceTimeResult>.from(
                json["result"]!.map((x) => ServiceTimeResult.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
        "message": message,
      };
}
