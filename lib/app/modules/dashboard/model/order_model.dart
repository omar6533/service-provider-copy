// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloundry_care/app/modules/dashboard/controllers/order_controller.dart';

class HomeDetailModel {
  final String title;
  final String number;
  final String description;
  HomeDetailModel({
    required this.title,
    required this.number,
    required this.description,
  });
}

class OrderModel {
  String? orderID;
  String? buildingName;
  String? apartmentName;
  String? floorNumber;
  String? street;
  final StatusSort statusSort;
  String? lat;
  String? lng;
  String? file;
  String? date;
  String? cleaner;

  String? rooms;
  String? beds;
  String? baths;
  String? living;
  String? requestCleanServiceId;
  DateTime? requestCleanServiceDate;
  bool? isAssigned;

  String? originStatus;
  OrderModel({
    this.orderID,
    this.buildingName,
    this.apartmentName,
    this.floorNumber,
    this.street,
    required this.statusSort,
    this.lat,
    this.lng,
    this.file,
    this.date,
    this.cleaner,
    this.originStatus,
    this.rooms,
    this.beds,
    this.baths,
    this.living,
    this.requestCleanServiceId,
    this.requestCleanServiceDate,
    this.isAssigned,
  });
}

class SearchForPersonModel {
  final String cleanerName;
  final int houseNumber;
  final int cleanerId;
  SearchForPersonModel({
    required this.cleanerName,
    required this.houseNumber,
    required this.cleanerId,
  });
}
