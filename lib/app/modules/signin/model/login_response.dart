// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:cloundry_care/util/constant/app_keys.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class EmployeeInfo {
  int? spEmployeeId;
  int? serviceProviderId;
  int? userId;
  int? employeeIdDocNumber;
  String? employeeDateOfBirth;
  String? employeeGender;
  bool? employeeIsActive;
  String? employeeCreateDate;

  EmployeeInfo({
    this.spEmployeeId,
    this.serviceProviderId,
    this.userId,
    this.employeeIdDocNumber,
    this.employeeDateOfBirth,
    this.employeeGender,
    this.employeeIsActive,
    this.employeeCreateDate,
  });

  factory EmployeeInfo.fromJson(Map? json) => EmployeeInfo(
        spEmployeeId: json?["spEmployeeId"],
        serviceProviderId: json?["serviceProviderId"],
        userId: json?["userId"],
        employeeIdDocNumber: json?["employeeIdDocNumber"],
        employeeDateOfBirth: json?["employeeDateOfBirth"],
        employeeGender: json?["employeeGender"],
        employeeIsActive: json?["employeeIsActive"],
        employeeCreateDate: json?["employeeCreateDate"],
      );

  Map<String, dynamic> toJson() => {
        "spEmployeeId": spEmployeeId,
        "serviceProviderId": serviceProviderId,
        "userId": userId,
        "employeeIdDocNumber": employeeIdDocNumber,
        "employeeDateOfBirth": employeeDateOfBirth,
        "employeeGender": employeeGender,
        "employeeIsActive": employeeIsActive,
        "employeeCreateDate": employeeCreateDate,
      };
}

class LoginResponse {
  bool? status;
  int? userId;
  String? userName;
  String? userFullname;
  String? token;
  String? userRloe;
  EmployeeInfo? employeeInfo;
  String? messageAr;
  String? messageEn;

  LoginResponse({
    this.status,
    this.userId,
    this.userName,
    this.userFullname,
    this.token,
    this.userRloe,
    this.employeeInfo,
    this.messageAr,
    this.messageEn,
  });

  factory LoginResponse.fromJson(Map? json) => LoginResponse(
        status: json?["status"],
        userId: json?["userId"],
        userName: json?["userName"],
        userFullname: json?["userFullname"],
        token: json?["token"],
        userRloe: json?["userRloe"],
        employeeInfo: json?["employeeInfo"] == null
            ? null
            : EmployeeInfo.fromJson(json?["employeeInfo"]),
        messageAr: json?["messageAr"],
        messageEn: json?["messageEn"],
      );

  String get messageError => isArabic ? messageAr ?? '' : messageEn ?? '';

  Map<String, dynamic> toJson() => {
        "status": status,
        "userId": userId,
        "userName": userName,
        "userFullname": userFullname,
        "token": token,
        "userRloe": userRloe,
        "employeeInfo": employeeInfo?.toJson(),
        "messageAr": messageAr,
        "messageEn": messageEn,
      };
}
