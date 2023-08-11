// To parse this JSON data, do
//
//     final cleanerResponse = cleanerResponseFromJson(jsonString);

import 'dart:convert';

CleanerResponse cleanerResponseFromJson(String str) =>
    CleanerResponse.fromJson(json.decode(str));

String cleanerResponseToJson(CleanerResponse data) =>
    json.encode(data.toJson());

class CleanerResponse {
  bool? status;
  List<CleanerResponseResult>? result;
  String? message;

  CleanerResponse({
    this.status,
    this.result,
    this.message,
  });

  factory CleanerResponse.fromJson(Map<String, dynamic> json) =>
      CleanerResponse(
        status: json["status"],
        result: json["result"] == null
            ? []
            : List<CleanerResponseResult>.from(
                json["result"]!.map((x) => CleanerResponseResult.fromJson(x))),
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

class CleanerResponseResult {
  int? userId;
  String? userFName;
  String? userLName;
  String? userName;
  String? userCreateDate;
  String? userEmail;
  String? userPhone;
  String? userPassword;
  int? spEmployeeId;
  int? employeeIdDocNumber;
  String? employeeDateOfBirth;
  String? employeeGender;
  bool? employeeIsActive;

  CleanerResponseResult({
    this.userId,
    this.userFName,
    this.userLName,
    this.userName,
    this.userCreateDate,
    this.userEmail,
    this.userPhone,
    this.userPassword,
    this.spEmployeeId,
    this.employeeIdDocNumber,
    this.employeeDateOfBirth,
    this.employeeGender,
    this.employeeIsActive,
  });

  factory CleanerResponseResult.fromJson(Map<String, dynamic> json) =>
      CleanerResponseResult(
        userId: json["userId"],
        userFName: json["userFName"],
        userLName: json["userLName"],
        userName: json["userName"],
        userCreateDate: json["userCreateDate"],
        userEmail: json["userEmail"],
        userPhone: json["userPhone"],
        userPassword: json["userPassword"],
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
        "userPhone": userPhone,
        "userPassword": userPassword,
        "spEmployeeId": spEmployeeId,
        "employeeIdDocNumber": employeeIdDocNumber,
        "employeeDateOfBirth": employeeDateOfBirth,
        "employeeGender": employeeGender,
        "employeeIsActive": employeeIsActive,
      };
}
