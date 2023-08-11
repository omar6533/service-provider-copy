// To parse this JSON data, do
//
//     final assignRequestCleanServiceToEmployeeResponse = assignRequestCleanServiceToEmployeeResponseFromJson(jsonString);

import 'dart:convert';

AssignRequestCleanServiceToEmployeeResponse
    assignRequestCleanServiceToEmployeeResponseFromJson(String str) =>
        AssignRequestCleanServiceToEmployeeResponse.fromJson(json.decode(str));

String assignRequestCleanServiceToEmployeeResponseToJson(
        AssignRequestCleanServiceToEmployeeResponse data) =>
    json.encode(data.toJson());

class AssignRequestCleanServiceToEmployeeResponse {
  bool? status;
  AssignRequestCleanServiceToEmployeeResponseResult? result;
  String? message;

  AssignRequestCleanServiceToEmployeeResponse({
    this.status,
    this.result,
    this.message,
  });

  factory AssignRequestCleanServiceToEmployeeResponse.fromJson(
          Map<String, dynamic> json) =>
      AssignRequestCleanServiceToEmployeeResponse(
        status: json["status"],
        result: json["result"] == null
            ? null
            : AssignRequestCleanServiceToEmployeeResponseResult.fromJson(
                json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
        "message": message,
      };
}

class AssignRequestCleanServiceToEmployeeResponseResult {
  int? spOrderAssignId;
  int? requestCleanServiceId;
  int? serviceProviderId;
  int? serviceTimeSlotId;
  int? spEmployeeId;
  DateTime? spOrderAssignCreateDate;

  AssignRequestCleanServiceToEmployeeResponseResult({
    this.spOrderAssignId,
    this.requestCleanServiceId,
    this.serviceProviderId,
    this.serviceTimeSlotId,
    this.spEmployeeId,
    this.spOrderAssignCreateDate,
  });

  factory AssignRequestCleanServiceToEmployeeResponseResult.fromJson(
          Map<String, dynamic> json) =>
      AssignRequestCleanServiceToEmployeeResponseResult(
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
