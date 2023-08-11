// To parse this JSON data, do
//
//     final pendingRequestResponse = pendingRequestResponseFromJson(jsonString);

import 'dart:convert';

PendingRequestResponse pendingRequestResponseFromJson(String str) =>
    PendingRequestResponse.fromJson(json.decode(str));

String pendingRequestResponseToJson(PendingRequestResponse data) =>
    json.encode(data.toJson());

class PendingRequestResponse {
  bool? status;
  List<Result>? result;
  String? message;

  PendingRequestResponse({
    this.status,
    this.result,
    this.message,
  });

  factory PendingRequestResponse.fromJson(Map<String, dynamic> json) =>
      PendingRequestResponse(
        status: json["status"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
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

class Property {
  int? propertyId;
  int? organizationId;
  int? propertyTypeId;
  String? propertyName;
  int? propertyNumber;
  bool? propertyIsDeteled;
  double? propertylatitude;
  double? propertylongitude;
  String? propertyAddress;
  DateTime? propertyCreateDate;

  Property({
    this.propertyId,
    this.organizationId,
    this.propertyTypeId,
    this.propertyName,
    this.propertyNumber,
    this.propertyIsDeteled,
    this.propertylatitude,
    this.propertylongitude,
    this.propertyAddress,
    this.propertyCreateDate,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        propertyId: json["propertyId"],
        organizationId: json["organizationId"],
        propertyTypeId: json["propertyTypeId"],
        propertyName: json["propertyName"],
        propertyNumber: json["propertyNumber"],
        propertyIsDeteled: json["propertyIsDeteled"],
        propertylatitude: json["propertylatitude"]?.toDouble(),
        propertylongitude: json["propertylongitude"]?.toDouble(),
        propertyAddress: json["propertyAddress"],
        propertyCreateDate: json["propertyCreateDate"] == null
            ? null
            : DateTime.parse(json["propertyCreateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "propertyId": propertyId,
        "organizationId": organizationId,
        "propertyTypeId": propertyTypeId,
        "propertyName": propertyName,
        "propertyNumber": propertyNumber,
        "propertyIsDeteled": propertyIsDeteled,
        "propertylatitude": propertylatitude,
        "propertylongitude": propertylongitude,
        "propertyAddress": propertyAddress,
        "propertyCreateDate": propertyCreateDate?.toIso8601String(),
      };
}

class PropertyUnit {
  int? propertyUnitId;
  int? propertyId;
  int? unitNumber;
  int? unitfloorNumber;
  bool? propertyUnitDeteled;
  DateTime? propertyUnitCreateDate;

  PropertyUnit({
    this.propertyUnitId,
    this.propertyId,
    this.unitNumber,
    this.unitfloorNumber,
    this.propertyUnitDeteled,
    this.propertyUnitCreateDate,
  });

  factory PropertyUnit.fromJson(Map<String, dynamic> json) => PropertyUnit(
        propertyUnitId: json["propertyUnitId"],
        propertyId: json["propertyId"],
        unitNumber: json["unitNumber"],
        unitfloorNumber: json["unitfloorNumber"],
        propertyUnitDeteled: json["propertyUnitDeteled"],
        propertyUnitCreateDate: json["propertyUnitCreateDate"] == null
            ? null
            : DateTime.parse(json["propertyUnitCreateDate"]),
      );

  Map<String, dynamic> toJson() => {
        "propertyUnitId": propertyUnitId,
        "propertyId": propertyId,
        "unitNumber": unitNumber,
        "unitfloorNumber": unitfloorNumber,
        "propertyUnitDeteled": propertyUnitDeteled,
        "propertyUnitCreateDate": propertyUnitCreateDate?.toIso8601String(),
      };
}

class PropertyUnitDetail {
  int? propertyUnitDetailsId;
  int? propertyUnitId;
  int? unitRoomsNumber;
  int? unitBathsNumber;
  int? unitLivingsNumber;
  int? unitBedsDoubleNumber;
  int? unitBedsSingleNumber;
  bool? unitHaveOutDoor;

  PropertyUnitDetail({
    this.propertyUnitDetailsId,
    this.propertyUnitId,
    this.unitRoomsNumber,
    this.unitBathsNumber,
    this.unitLivingsNumber,
    this.unitBedsDoubleNumber,
    this.unitBedsSingleNumber,
    this.unitHaveOutDoor,
  });

  factory PropertyUnitDetail.fromJson(Map<String, dynamic> json) =>
      PropertyUnitDetail(
        propertyUnitDetailsId: json["propertyUnitDetailsId"],
        propertyUnitId: json["propertyUnitId"],
        unitRoomsNumber: json["unitRoomsNumber"],
        unitBathsNumber: json["unitBathsNumber"],
        unitLivingsNumber: json["unitLivingsNumber"],
        unitBedsDoubleNumber: json["unitBedsDoubleNumber"],
        unitBedsSingleNumber: json["unitBedsSingleNumber"],
        unitHaveOutDoor: json["unitHaveOutDoor"],
      );

  Map<String, dynamic> toJson() => {
        "propertyUnitDetailsId": propertyUnitDetailsId,
        "propertyUnitId": propertyUnitId,
        "unitRoomsNumber": unitRoomsNumber,
        "unitBathsNumber": unitBathsNumber,
        "unitLivingsNumber": unitLivingsNumber,
        "unitBedsDoubleNumber": unitBedsDoubleNumber,
        "unitBedsSingleNumber": unitBedsSingleNumber,
        "unitHaveOutDoor": unitHaveOutDoor,
      };
}

class RequestCleanService {
  int? requestCleanServiceId;
  int? unitCheckoutDateId;
  DateTime? requestCleanServiceCreateDate;
  bool? requestCleanServiceIsDeteled;
  String? requestCleanServiceStatus;

  RequestCleanService({
    this.requestCleanServiceId,
    this.unitCheckoutDateId,
    this.requestCleanServiceCreateDate,
    this.requestCleanServiceIsDeteled,
    this.requestCleanServiceStatus,
  });

  factory RequestCleanService.fromJson(Map<String, dynamic> json) =>
      RequestCleanService(
        requestCleanServiceId: json["requestCleanServiceId"],
        unitCheckoutDateId: json["unitCheckoutDateId"],
        requestCleanServiceCreateDate:
            json["requestCleanServiceCreateDate"] == null
                ? null
                : DateTime.parse(json["requestCleanServiceCreateDate"]),
        requestCleanServiceIsDeteled: json["requestCleanServiceIsDeteled"],
        requestCleanServiceStatus: json["requestCleanServiceStatus"],
      );

  Map<String, dynamic> toJson() => {
        "requestCleanServiceId": requestCleanServiceId,
        "unitCheckoutDateId": unitCheckoutDateId,
        "requestCleanServiceCreateDate":
            requestCleanServiceCreateDate?.toIso8601String(),
        "requestCleanServiceIsDeteled": requestCleanServiceIsDeteled,
        "requestCleanServiceStatus": requestCleanServiceStatus,
      };
}

class Result {
  SpOrderActivity? spOrderActivity;
  RequestCleanService? requestCleanService;
  RequestCleanService? request;
  UnitCheckoutDate? unitCheckoutDate;
  PropertyUnit? propertyUnit;
  PropertyUnitDetail? propertyUnitDetail;
  Property? property;

  Result({
    this.spOrderActivity,
    this.requestCleanService,
    this.request,
    this.unitCheckoutDate,
    this.propertyUnit,
    this.propertyUnitDetail,
    this.property,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        spOrderActivity: json["spOrderActivity"] == null
            ? null
            : SpOrderActivity.fromJson(json["spOrderActivity"]),
        requestCleanService: json["requestCleanService"] == null
            ? null
            : RequestCleanService.fromJson(json["requestCleanService"]),
        request: json["request"] == null
            ? null
            : RequestCleanService.fromJson(json["request"]),
        unitCheckoutDate: json["unitCheckoutDate"] == null
            ? null
            : UnitCheckoutDate.fromJson(json["unitCheckoutDate"]),
        propertyUnit: json["propertyUnit"] == null
            ? null
            : PropertyUnit.fromJson(json["propertyUnit"]),
        propertyUnitDetail: json["propertyUnitDetail"] == null
            ? null
            : PropertyUnitDetail.fromJson(json["propertyUnitDetail"]),
        property: json["property"] == null
            ? null
            : Property.fromJson(json["property"]),
      );

  Map<String, dynamic> toJson() => {
        "spOrderActivity": spOrderActivity?.toJson(),
        "requestCleanService": requestCleanService?.toJson(),
        "request": request?.toJson(),
        "unitCheckoutDate": unitCheckoutDate?.toJson(),
        "propertyUnit": propertyUnit?.toJson(),
        "propertyUnitDetail": propertyUnitDetail?.toJson(),
        "property": property?.toJson(),
      };
}

class SpOrderActivity {
  int? spOrderActivityId;
  int? serviceProviderId;
  int? requestCleanServiceId;
  int? userId;
  String? spOrderActivityStatus;
  DateTime? spOrderActivityCreateDate;
  int? serviceTimeSlotId;

  SpOrderActivity({
    this.spOrderActivityId,
    this.serviceProviderId,
    this.requestCleanServiceId,
    this.userId,
    this.spOrderActivityStatus,
    this.spOrderActivityCreateDate,
    this.serviceTimeSlotId,
  });

  factory SpOrderActivity.fromJson(Map<String, dynamic> json) =>
      SpOrderActivity(
        spOrderActivityId: json["spOrderActivityId"],
        serviceProviderId: json["serviceProviderId"],
        requestCleanServiceId: json["requestCleanServiceId"],
        userId: json["userId"],
        spOrderActivityStatus: json["spOrderActivityStatus"],
        spOrderActivityCreateDate: json["spOrderActivityCreateDate"] == null
            ? null
            : DateTime.parse(json["spOrderActivityCreateDate"]),
        serviceTimeSlotId: json['serviceTimeSlotId'],
      );

  Map<String, dynamic> toJson() => {
        "spOrderActivityId": spOrderActivityId,
        "serviceProviderId": serviceProviderId,
        "requestCleanServiceId": requestCleanServiceId,
        "userId": userId,
        "spOrderActivityStatus": spOrderActivityStatus,
        "spOrderActivityCreateDate":
            spOrderActivityCreateDate?.toIso8601String(),
        "serviceTimeSlotId": serviceTimeSlotId,
      };
}

class UnitCheckoutDate {
  int? unitCheckoutDateId;
  int? propertyUnitId;
  DateTime? unitCheckoutDateTime;

  UnitCheckoutDate({
    this.unitCheckoutDateId,
    this.propertyUnitId,
    this.unitCheckoutDateTime,
  });

  factory UnitCheckoutDate.fromJson(Map<String, dynamic> json) =>
      UnitCheckoutDate(
        unitCheckoutDateId: json["unitCheckoutDateId"],
        propertyUnitId: json["propertyUnitId"],
        unitCheckoutDateTime: json["unitCheckoutDateTime"] == null
            ? null
            : DateTime.parse(json["unitCheckoutDateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "unitCheckoutDateId": unitCheckoutDateId,
        "propertyUnitId": propertyUnitId,
        "unitCheckoutDateTime": unitCheckoutDateTime?.toIso8601String(),
      };
}
