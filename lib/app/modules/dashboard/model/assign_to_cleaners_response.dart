
// To parse this JSON data, do
//
//     final assignToCleanersResponse = assignToCleanersResponseFromJson(jsonString);

import 'dart:convert';

AssignToCleanersResponse assignToCleanersResponseFromJson(String str) =>
    AssignToCleanersResponse.fromJson(json.decode(str));

String assignToCleanersResponseToJson(AssignToCleanersResponse data) =>
    json.encode(data.toJson());

class AssignToCleanersResponse {
  bool? status;
  List<AssignToCleanersResponseResult>? result;
  String? message;

  AssignToCleanersResponse({
    this.status,
    this.result,
    this.message,
  });

  factory AssignToCleanersResponse.fromJson(Map<String, dynamic> json) =>
      AssignToCleanersResponse(
        status: json["status"],
        result: json["result"] == null
            ? []
            : List<AssignToCleanersResponseResult>.from(json["result"]!
                .map((x) => AssignToCleanersResponseResult.fromJson(x))),
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

class AssignToCleanersResponseResult {
  int? userId;
  String? userFName;
  String? userLName;
  String? userName;
  int? spEmployeeId;
  int? serviceProviderId;
  int? countAssign;

  AssignToCleanersResponseResult({
    this.userId,
    this.userFName,
    this.userLName,
    this.userName,
    this.spEmployeeId,
    this.serviceProviderId,
    this.countAssign,
  });

  factory AssignToCleanersResponseResult.fromJson(Map<String, dynamic> json) =>
      AssignToCleanersResponseResult(
        userId: json["userId"],
        userFName: json["userFName"],
        userLName: json["userLName"],
        userName: json["userName"],
        spEmployeeId: json["spEmployeeId"],
        serviceProviderId: json["serviceProviderId"],
        countAssign: json["countAssign"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userFName": userFName,
        "userLName": userLName,
        "userName": userName,
        "spEmployeeId": spEmployeeId,
        "serviceProviderId": serviceProviderId,
        "countAssign": countAssign,
      };
}
