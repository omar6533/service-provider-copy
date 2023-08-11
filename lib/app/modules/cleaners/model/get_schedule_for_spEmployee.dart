// To parse this JSON data, do
//
//     final getOrderAssignScheduleForSpEmployee = getOrderAssignScheduleForSpEmployeeFromJson(jsonString);

import 'dart:convert';

import 'package:cloundry_care/app/modules/dashboard/model/service_time_response.dart';

GetOrderAssignScheduleForSpEmployee getOrderAssignScheduleForSpEmployeeFromJson(
        String str) =>
    GetOrderAssignScheduleForSpEmployee.fromJson(json.decode(str));

class GetOrderAssignScheduleForSpEmployee {
  bool? status;
  List<GetOrderAssignScheduleForSpEmployeeResult>? result;
  String? message;

  GetOrderAssignScheduleForSpEmployee({
    this.status,
    this.result,
    this.message,
  });

  factory GetOrderAssignScheduleForSpEmployee.fromJson(
          Map<String, dynamic> json) =>
      GetOrderAssignScheduleForSpEmployee(
        status: json["status"],
        result: json["result"] == null
            ? []
            : List<GetOrderAssignScheduleForSpEmployeeResult>.from(
                json["result"]!.map((x) =>
                    GetOrderAssignScheduleForSpEmployeeResult.fromJson(x))),
        message: json["message"],
      );
}

class GetOrderAssignScheduleForSpEmployeeResult {
  SpOrderAssign? spOrderAssign;
  ServiceTimeResult? serviceTime;

  GetOrderAssignScheduleForSpEmployeeResult({
    this.spOrderAssign,
    this.serviceTime,
  });

  factory GetOrderAssignScheduleForSpEmployeeResult.fromJson(
          Map<String, dynamic> json) =>
      GetOrderAssignScheduleForSpEmployeeResult(
        spOrderAssign: json["spOrderAssign"] == null
            ? null
            : SpOrderAssign.fromJson(json["spOrderAssign"]),
        serviceTime: json["serviceTime"] == null
            ? null
            : ServiceTimeResult.fromJson(json["serviceTime"]),
      );
}

class SpOrderAssign {
  int? spOrderAssignId;
  int? requestCleanServiceId;
  int? serviceProviderId;
  int? serviceTimeSlotId;
  int? spEmployeeId;
  DateTime? spOrderAssignCreateDate;

  SpOrderAssign({
    this.spOrderAssignId,
    this.requestCleanServiceId,
    this.serviceProviderId,
    this.serviceTimeSlotId,
    this.spEmployeeId,
    this.spOrderAssignCreateDate,
  });

  factory SpOrderAssign.fromJson(Map<String, dynamic> json) => SpOrderAssign(
        spOrderAssignId: json["spOrderAssignId"],
        requestCleanServiceId: json["requestCleanServiceId"],
        serviceProviderId: json["serviceProviderId"],
        serviceTimeSlotId: json["serviceTimeSlotId"],
        spEmployeeId: json["spEmployeeId"],
        spOrderAssignCreateDate: json["spOrderAssignCreateDate"] == null
            ? null
            : DateTime.parse(json["spOrderAssignCreateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "spOrderAssignId": spOrderAssignId,
        "requestCleanServiceId": requestCleanServiceId,
        "serviceProviderId": serviceProviderId,
        "serviceTimeSlotId": serviceTimeSlotId,
        "spEmployeeId": spEmployeeId,
        "spOrderAssignCreateDate": spOrderAssignCreateDate?.toIso8601String(),
      };
}
