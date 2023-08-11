// To parse this JSON data, do
//
//     final spOrderAssignResponse = spOrderAssignResponseFromJson(jsonString);

import 'dart:convert';

SpOrderAssignResponse spOrderAssignResponseFromJson(String str) =>
    SpOrderAssignResponse.fromJson(json.decode(str));

class SpOrderAssignResponse {
  bool? status;
  List<SpOrderAssignResponseResult>? result;
  String? message;

  SpOrderAssignResponse({
    this.status,
    this.result,
    this.message,
  });

  factory SpOrderAssignResponse.fromJson(Map<String, dynamic> json) =>
      SpOrderAssignResponse(
        status: json["status"],
        result: json["result"] == null
            ? []
            : List<SpOrderAssignResponseResult>.from(json["result"]!
                .map((x) => SpOrderAssignResponseResult.fromJson(x))),
        message: json["message"],
      );
}

class SpOrderAssignResponseResult {
  int? spOrderAssignId;
  int? requestCleanServiceId;
  int? serviceProviderId;
  int? serviceTimeSlotId;
  int? spEmployeeId;
  DateTime? spOrderAssignCreateDate;

  SpOrderAssignResponseResult({
    this.spOrderAssignId,
    this.requestCleanServiceId,
    this.serviceProviderId,
    this.serviceTimeSlotId,
    this.spEmployeeId,
    this.spOrderAssignCreateDate,
  });

  factory SpOrderAssignResponseResult.fromJson(Map<String, dynamic> json) =>
      SpOrderAssignResponseResult(
        spOrderAssignId: json["spOrderAssignId"],
        requestCleanServiceId: json["requestCleanServiceId"],
        serviceProviderId: json["serviceProviderId"],
        serviceTimeSlotId: json["serviceTimeSlotId"],
        spEmployeeId: json["spEmployeeId"],
        spOrderAssignCreateDate: json["spOrderAssignCreateDate"] == null
            ? null
            : DateTime.parse(json["spOrderAssignCreateDate"]),
      );
}
