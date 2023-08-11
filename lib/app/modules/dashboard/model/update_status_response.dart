// To parse this JSON data, do
//
//     final updateStatusResponse = updateStatusResponseFromJson(jsonString);

import 'dart:convert';

UpdateStatusResponse updateStatusResponseFromJson(String str) =>
    UpdateStatusResponse.fromJson(json.decode(str));

String updateStatusResponseToJson(UpdateStatusResponse data) =>
    json.encode(data.toJson());

class ResultUpdateStatus {
  int? spOrderActivityId;
  int? serviceProviderId;
  int? requestCleanServiceId;
  int? userId;
  String? spOrderActivityStatus;
  DateTime? spOrderActivityCreateDate;

  ResultUpdateStatus({
    this.spOrderActivityId,
    this.serviceProviderId,
    this.requestCleanServiceId,
    this.userId,
    this.spOrderActivityStatus,
    this.spOrderActivityCreateDate,
  });

  factory ResultUpdateStatus.fromJson(Map<String, dynamic> json) =>
      ResultUpdateStatus(
        spOrderActivityId: json["spOrderActivityId"],
        serviceProviderId: json["serviceProviderId"],
        requestCleanServiceId: json["requestCleanServiceId"],
        userId: json["userId"],
        spOrderActivityStatus: json["spOrderActivityStatus"],
        spOrderActivityCreateDate: json["spOrderActivityCreateDate"] == null
            ? null
            : DateTime.parse(json["spOrderActivityCreateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "spOrderActivityId": spOrderActivityId,
        "serviceProviderId": serviceProviderId,
        "requestCleanServiceId": requestCleanServiceId,
        "userId": userId,
        "spOrderActivityStatus": spOrderActivityStatus,
        "spOrderActivityCreateDate":
            spOrderActivityCreateDate?.toIso8601String(),
      };
}

class UpdateStatusResponse {
  bool? status;
  ResultUpdateStatus? result;
  String? message;

  UpdateStatusResponse({
    this.status,
    this.result,
    this.message,
  });

  factory UpdateStatusResponse.fromJson(Map<String, dynamic> json) =>
      UpdateStatusResponse(
        status: json["status"],
        result: json["result"] == null
            ? null
            : ResultUpdateStatus.fromJson(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
        "message": message,
      };
}
