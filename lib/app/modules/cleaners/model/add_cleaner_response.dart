// To parse this JSON data, do
//
//     final cleanerResponse = cleanerResponseFromJson(jsonString);

import 'dart:convert';

AddCleanerResponse cleanerResponseFromJson(String str) =>
    AddCleanerResponse.fromJson(json.decode(str));

String cleanerResponseToJson(AddCleanerResponse data) =>
    json.encode(data.toJson());

class AddCleanerResponse {
  bool? status;
  AddCleanerResponseResult? result;
  String? message;

  AddCleanerResponse({
    this.status,
    this.result,
    this.message,
  });

  factory AddCleanerResponse.fromJson(Map<String, dynamic> json) =>
      AddCleanerResponse(
        status: json["status"],
        result: json["result"] == null
            ? null
            : AddCleanerResponseResult.fromJson(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result == null ? [] : result?.toJson(),
        "message": message,
      };
}

class AddCleanerResponseResult {
  int? userId;
  String? userFName;
  String? userLName;
  String? userName;
  String? userCreateDate;
  String? userEmail;
  int? spEmployeeId;
  int? employeeIdDocNumber;
  String? employeeDateOfBirth;
  String? employeeGender;
  bool? employeeIsActive;

  AddCleanerResponseResult({
    this.userId,
    this.userFName,
    this.userLName,
    this.userName,
    this.userCreateDate,
    this.userEmail,
    this.spEmployeeId,
    this.employeeIdDocNumber,
    this.employeeDateOfBirth,
    this.employeeGender,
    this.employeeIsActive,
  });

  factory AddCleanerResponseResult.fromJson(Map<String, dynamic> json) =>
      AddCleanerResponseResult(
        userId: json["userId"],
        userFName: json["userFName"],
        userLName: json["userLName"],
        userName: json["userName"],
        userCreateDate: json["userCreateDate"],
        userEmail: json["userEmail"],
        spEmployeeId: json["spEmployeeId"],
        employeeIdDocNumber: json["employeeIdDocNumber"],
        employeeDateOfBirth: json["employeeDateOfBirth"],
        employeeGender: json["employeeGender"],
        employeeIsActive: json["employeeIsActive"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userFName": userFName,
        "userLName": userLName,
        "userName": userName,
        "userCreateDate": userCreateDate,
        "userEmail": userEmail,
        "spEmployeeId": spEmployeeId,
        "employeeIdDocNumber": employeeIdDocNumber,
        "employeeDateOfBirth": employeeDateOfBirth,
        "employeeGender": employeeGender,
        "employeeIsActive": employeeIsActive,
      };
}
