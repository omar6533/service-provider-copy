import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/cleaners/controllers/cleaners_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/model/assign_employee_response.dart';
import 'package:cloundry_care/app/modules/dashboard/model/get_sp_employee_available.dart';
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:cloundry_care/app/modules/dashboard/model/pending_request_response.dart';
import 'package:cloundry_care/app/modules/dashboard/model/sporder_assign_response.dart';
import 'package:cloundry_care/app/modules/dashboard/model/update_status_response.dart';
import 'package:cloundry_care/app/network/network_request.dart';
import 'package:cloundry_care/app/network/network_request_body.dart';
import 'package:cloundry_care/app/network/network_service.dart';
import 'package:cloundry_care/util/background_api_caller.dart';
import 'package:cloundry_care/util/constant/app_assets.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/constant/end_points.dart';
import 'package:cloundry_care/util/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/base_controller.dart';
import '../../../../util/constant/app_colors.dart';
import '../model/assign_to_cleaners_response.dart';

class OrdersController extends BaseController {
  RxBool isAccepted = false.obs;
  RxBool isSelected = false.obs;
  RxBool isAssigned = false.obs;
  RxInt currentIndex = (-1).obs;
  RxInt activeIndex = (0).obs;

  RxDouble remainingEmp = (0.0).obs;
  RxInt busyEmp = 0.obs;

  Rx<SearchForPersonModel> cleanerName =
      SearchForPersonModel(cleanerId: -1, cleanerName: '', houseNumber: -1).obs;
  RxInt currentTimeBooked = (-1).obs;
  RxBool isDone = false.obs;
  RxList<SearchForPersonModel> searchForPersonList =
      List<SearchForPersonModel>.of([]).obs;

  late BackgroundApiCaller pendingApiCaller;
  late BackgroundApiCaller acceptedApiCaller;
  RxList<String> views =
      List<String>.of([AppAssets.view1, AppAssets.view2, AppAssets.view3]).obs;
  RxList<int> assignedList = List<int>.of([]).obs;

  RxList<OrderModel> pendingOrderList = List<OrderModel>.of([]).obs;

  RxList<OrderModel> acceptedOrderList = List<OrderModel>.of([]).obs;
  RxList<OrderModel> assigedOrderList = List<OrderModel>.of([]).obs;

  CleanersController cleanersController = Get.put(CleanersController());

  Future assignRequestCleanServiceToEmp(
      BuildContext context, OrderModel orderModel) async {
    var currentUser = await getCurrentUser();
    showLoaderDialog(context);
    var data = {
      "spOrderAssignId": 0,
      "requestCleanServiceId":
          int.tryParse(orderModel.requestCleanServiceId ?? '-1') ?? -1,
      "serviceProviderId": currentUser?.employeeInfo?.serviceProviderId ?? -1,
      "serviceTimeSlotId": currentTimeBooked.value,
      "spEmployeeId": cleanerName.value.cleanerId,
      "spOrderAssignCreateDate":
          DateFormat("yyyy-MM-ddTHH:mm:ss.sss").format(DateTime.now()),
    };

    await NetworkService().execute(
        NetworkRequest(
          type: NetworkRequestType.POST,
          path: AppEndPoints.assignRequestCleanServiceToEmployee,
          data: NetworkRequestBody.json(data),
          headers: {'Authorization': 'Bearer ${currentUser?.token ?? ''}'},
        ), (response) {
      return AssignRequestCleanServiceToEmployeeResponse.fromJson(response);
    }).then((value) {
      dismissLoaderDialog(context);
      value.when(
        ok: (data) async {
          if (data is AssignRequestCleanServiceToEmployeeResponse) {
            if (data.status == true) {
              await context.popRoute();
              getAllHomeInfo(context, showLoading: false);
            } else {
              currentTimeBooked.value = -1;
            }
          }
        },
        invalidParameters: (message) {
          debugPrint("invalidParameters : $message");
        },
        noAuth: (message) async {
          showErrorMsg('your session has been expired, please login again'.tr);
          await GetStorage().remove(currentUserKey);
          // ignore: use_build_context_synchronously
          context.replaceRoute(const SigninView());
        },
        noAccess: (message) {
          debugPrint("noAccess : $message");
        },
        badRequest: (message) async {
          debugPrint("badRequest : $message");
        },
        notFound: (message) {
          debugPrint("notFound : $message");
        },
        conflict: (message) {
          debugPrint("conflict : $message");
        },
        noData: (message) {
          debugPrint("noData : $message");
        },
      );
    });
  }

  Future assignToCleaners(BuildContext context, OrderModel orderModel) async {
    var currentUser = await getCurrentUser();

    var data = {
      "requestCleanServiceId": orderModel.requestCleanServiceId,
      "serviceProviderId": currentUser?.employeeInfo?.serviceProviderId ?? -1,
    };

    await NetworkService().execute(
        NetworkRequest(
          type: NetworkRequestType.POST,
          path: AppEndPoints.getSpEmployeeForOrderAssign,
          data: NetworkRequestBody.json(data),
          headers: {'Authorization': 'Bearer ${currentUser?.token ?? ''}'},
        ), (response) {
      return AssignToCleanersResponse.fromJson(response);
    }).then((value) {
      value.when(
        ok: (data) async {
          if (data is AssignToCleanersResponse) {
            if (data.status == true) {
              searchForPersonList.value = (data.result)?.map((e) {
                    return SearchForPersonModel(
                      cleanerName: '${e.userFName}${e.userLName}',
                      houseNumber: e.countAssign ?? -1,
                      cleanerId: e.spEmployeeId ?? -1,
                    );
                  }).toList() ??
                  [];
            }
          }
        },
        invalidParameters: (message) {
          debugPrint("invalidParameters : $message");
        },
        noAuth: (message) async {
          showErrorMsg('your session has been expired, please login again'.tr);
          await GetStorage().remove(currentUserKey);
          // ignore: use_build_context_synchronously
          context.replaceRoute(const SigninView());
        },
        noAccess: (message) {
          debugPrint("noAccess : $message");
        },
        badRequest: (message) async {
          debugPrint("badRequest : $message");
        },
        notFound: (message) {
          debugPrint("notFound : $message");
        },
        conflict: (message) {
          debugPrint("conflict : $message");
        },
        noData: (message) {
          debugPrint("noData : $message");
        },
      );
    });
  }

  Future getAllAcceptedOrders(BuildContext context) async {
    var currentUser = await getCurrentUser();
    await NetworkService().execute(
        NetworkRequest(
          type: NetworkRequestType.GET,
          path:
              "${AppEndPoints.acceptedOrderRequestCleanService}/${currentUser?.employeeInfo?.serviceProviderId ?? -1}",
          data: const NetworkRequestBody.empty(),
        ), (response) {
      return PendingRequestResponse.fromJson(response);
    }).then((value) {
      value.when(
        ok: (data) async {
          if (data is PendingRequestResponse) {
            if (data.status == true) {
              _acceptedOrderMapping(data.result ?? [], context);
            }
          }
        },
        invalidParameters: (message) {
          debugPrint("invalidParameters : $message");
        },
        noAuth: (message) async {
          pendingApiCaller.stop();
          acceptedApiCaller.stop();
          showErrorMsg('your session has been expired, please login again'.tr);
          await GetStorage().remove(currentUserKey);
          // ignore: use_build_context_synchronously
          context.replaceRoute(const SigninView());
        },
        noAccess: (message) {
          debugPrint("noAccess : $message");
        },
        badRequest: (message) async {
          debugPrint("badRequest : $message");
        },
        notFound: (message) {
          debugPrint("notFound : $message");
        },
        conflict: (message) {
          debugPrint("conflict : $message");
        },
        noData: (message) {
          debugPrint("noData : $message");
        },
      );
    });
  }

  Future getAllCleaner(BuildContext context) async {
    await cleanersController.getAllCleaner(context);
  }

  Future getAllHomeInfo(BuildContext context, {bool showLoading = true}) async {
    if (showLoading) {
      showLoaderDialog(context);
    }
    await getAllCleaner(context);
    await Future.wait([
      // ignore: use_build_context_synchronously
      getAllPendingOrders(context),
      // ignore: use_build_context_synchronously
      getAllAcceptedOrders(context),
      // ignore: use_build_context_synchronously
      getSpEmployeeAvailableForToDay(context),
    ]);
    if (showLoading) {
      dismissLoaderDialog(context);
    }
    pendingApiCaller = BackgroundApiCaller(
      interval: const Duration(minutes: 5),
      callEvent: () {
        getAllPendingOrders(context);
      },
    );
    acceptedApiCaller = BackgroundApiCaller(
      interval: const Duration(minutes: 30),
      callEvent: () {
        getAllAcceptedOrders(context);
      },
    );
    pendingApiCaller.start();
    acceptedApiCaller.start();
  }

  Future getAllPendingOrders(BuildContext context) async {
    var currentUser = await getCurrentUser();
    await NetworkService().execute(
        NetworkRequest(
          type: NetworkRequestType.GET,
          path:
              "${AppEndPoints.allPendingRequestCleanService}/${currentUser?.employeeInfo?.serviceProviderId ?? -1}",
          data: const NetworkRequestBody.empty(),
        ), (response) {
      return PendingRequestResponse.fromJson(response);
    }).then((value) {
      value.when(
        ok: (data) async {
          if (data is PendingRequestResponse) {
            if (data.status == true) {
              _pendingOrderMapping(data.result ?? []);
            }
          }
        },
        invalidParameters: (message) {
          debugPrint("invalidParameters : $message");
        },
        noAuth: (message) async {
          pendingApiCaller.stop();
          acceptedApiCaller.stop();
          showErrorMsg('your session has been expired, please login again'.tr);
          await GetStorage().remove(currentUserKey);
          // ignore: use_build_context_synchronously
          context.replaceRoute(const SigninView());
        },
        noAccess: (message) {
          debugPrint("noAccess : $message");
        },
        badRequest: (message) async {
          debugPrint("badRequest : $message");
        },
        notFound: (message) {
          debugPrint("notFound : $message");
        },
        conflict: (message) {
          debugPrint("conflict : $message");
        },
        noData: (message) {
          debugPrint("noData : $message");
        },
      );
    });
  }

  Future getAllSpOrdersAssign(BuildContext context) async {
    var currentUser = await getCurrentUser();
    await NetworkService().execute(
        NetworkRequest(
          type: NetworkRequestType.GET,
          path:
              "${AppEndPoints.getAllSpOrderAssign}/${currentUser?.employeeInfo?.serviceProviderId ?? -1}",
          data: const NetworkRequestBody.empty(),
        ), (response) {
      return SpOrderAssignResponse.fromJson(response);
    }).then((value) {
      value.when(
        ok: (data) async {
          if (data is SpOrderAssignResponse) {
            if (data.status == true) {
              _pendingSpOrderAssignMapping(data.result ?? []);
            }
          }
        },
        invalidParameters: (message) {
          debugPrint("invalidParameters : $message");
        },
        noAuth: (message) async {
          pendingApiCaller.stop();
          acceptedApiCaller.stop();
          showErrorMsg('your session has been expired, please login again'.tr);
          await GetStorage().remove(currentUserKey);
          // ignore: use_build_context_synchronously
          context.replaceRoute(const SigninView());
        },
        noAccess: (message) {
          debugPrint("noAccess : $message");
        },
        badRequest: (message) async {
          debugPrint("badRequest : $message");
        },
        notFound: (message) {
          debugPrint("notFound : $message");
        },
        conflict: (message) {
          debugPrint("conflict : $message");
        },
        noData: (message) {
          debugPrint("noData : $message");
        },
      );
    });
  }

  Future getSpEmployeeAvailableForToDay(BuildContext context) async {
    var currentUser = await getCurrentUser();
    await NetworkService().execute(
        NetworkRequest(
          type: NetworkRequestType.GET,
          path:
              "${AppEndPoints.getSpEmployeeAvailableForToDay}/${currentUser?.employeeInfo?.serviceProviderId ?? -1}",
          data: const NetworkRequestBody.empty(),
        ), (response) {
      return GetSpEmployeeAvailableForToDay.fromJson(response);
    }).then((value) {
      value.when(
        ok: (data) async {
          if (data is GetSpEmployeeAvailableForToDay) {
            if (data.status == true) {
              var totalEmp = (data.listBusyEmployee?.length ?? 0) +
                  (data.listNonBusyEmployee?.length ?? 0);
              busyEmp.value = (data.listBusyEmployee?.length ?? 0);
              remainingEmp.value = totalEmp == 0
                  ? 0.0
                  : (data.listBusyEmployee?.length ?? 0) / totalEmp;
            }
          }
        },
        invalidParameters: (message) {
          debugPrint("invalidParameters : $message");
        },
        noAuth: (message) async {
          pendingApiCaller.stop();
          acceptedApiCaller.stop();
          showErrorMsg('your session has been expired, please login again'.tr);
          await GetStorage().remove(currentUserKey);
          // ignore: use_build_context_synchronously
          context.replaceRoute(const SigninView());
        },
        noAccess: (message) {
          debugPrint("noAccess : $message");
        },
        badRequest: (message) async {
          debugPrint("badRequest : $message");
        },
        notFound: (message) {
          debugPrint("notFound : $message");
        },
        conflict: (message) {
          debugPrint("conflict : $message");
        },
        noData: (message) {
          debugPrint("noData : $message");
        },
      );
    });
  }

  void navigateTo(double lat, double lng) async {
    print("https://www.google.com/maps/search/?api=1&query=$lat,$lng");
    var uri =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  Future updateOrderStatus(BuildContext context, StatusSort statusSort,
      OrderModel orderModel) async {
    var currentUser = await getCurrentUser();
    showLoaderDialog(context);
    await NetworkService().execute(
        NetworkRequest(
            type: NetworkRequestType.POST,
            path: AppEndPoints.updateRequestCleanServiceStatus,
            data: NetworkRequestBody.json({
              "RequestCleanServiceStatus":
                  statusSort == StatusSort.accepted ? "accepted" : "rejected",
              "RequestCleanServiceId": orderModel.requestCleanServiceId ?? '',
              "ServiceProviderId":
                  currentUser?.employeeInfo?.serviceProviderId ?? -1
            }),
            headers: {'Authorization': 'Bearer ${currentUser?.token ?? ''}'}),
        (response) {
      return UpdateStatusResponse.fromJson(response);
    }).then((value) {
      dismissLoaderDialog(context);
      value.when(
        ok: (data) async {
          if (data is UpdateStatusResponse) {
            if (data.status == true) {
              await context.popRoute();
              getAllHomeInfo(context, showLoading: false);
            }
          }
        },
        invalidParameters: (message) {
          debugPrint("invalidParameters : $message");
        },
        noAuth: (message) async {
          pendingApiCaller.stop();
          acceptedApiCaller.stop();
          showErrorMsg('your session has been expired, please login again'.tr);
          await GetStorage().remove(currentUserKey);
          // ignore: use_build_context_synchronously
          context.replaceRoute(const SigninView());
        },
        noAccess: (message) {
          debugPrint("noAccess : $message");
        },
        badRequest: (message) async {
          debugPrint("badRequest : $message");
        },
        notFound: (message) {
          debugPrint("notFound : $message");
        },
        conflict: (message) {
          debugPrint("conflict : $message");
        },
        noData: (message) {
          debugPrint("noData : $message");
        },
      );
    });
  }

  void _acceptedOrderMapping(
      List<Result> allpendingRequests, BuildContext context) {
    allpendingRequests.sort(
      (a, b) {
        var aRequestCleanServiceCreateDate =
            a.requestCleanService?.requestCleanServiceCreateDate ??
                DateTime.now();
        var bRequestCleanServiceCreateDate =
            b.requestCleanService?.requestCleanServiceCreateDate ??
                DateTime.now();
        return aRequestCleanServiceCreateDate
            .compareTo(bRequestCleanServiceCreateDate);
      },
    );

    var allRequests = allpendingRequests.map((e) {
      var cleanerItem = cleanersController.data.firstWhere(
        (element) => element.containsKey('id') == false
            ? false
            : ((int.tryParse(element['id'].toString()) ?? -3) ==
                (e.spOrderActivity?.userId ?? -2)),
        orElse: () => {},
      );
      return OrderModel(
        orderID: e.requestCleanService?.requestCleanServiceId.toString() ?? '0',
        buildingName: e.property?.propertyName ?? '',
        apartmentName: (e.propertyUnit?.unitNumber ?? 0).toString(),
        floorNumber: (e.propertyUnit?.unitfloorNumber ?? 0).toString(),
        street: '',
        date: DateFormat("dd/MMM/yyyy").format(
            e.requestCleanService?.requestCleanServiceCreateDate ??
                DateTime.now()),
        cleaner: cleanerItem.containsKey('Name') ? cleanerItem['Name'] : '',
        originStatus: e.requestCleanService?.requestCleanServiceStatus,
        statusSort: _getOrderStatus(
          e.requestCleanService?.requestCleanServiceStatus,
        ),
        lat: (e.property?.propertylatitude ?? 0).toString(),
        lng: (e.property?.propertylongitude ?? 0).toString(),
        living: (e.propertyUnitDetail?.unitLivingsNumber ?? 0).toString(),
        rooms: (e.propertyUnitDetail?.unitRoomsNumber ?? 0).toString(),
        requestCleanServiceId:
            (e.requestCleanService?.requestCleanServiceId ?? -1).toString(),
        requestCleanServiceDate:
            (e.requestCleanService?.requestCleanServiceCreateDate),
        baths: (e.propertyUnitDetail?.unitBathsNumber ?? 0).toString(),
        beds: (0).toString(), //this we don't have it
      );
    }).toList();
    assigedOrderList.value = allRequests
        .where((element) =>
            ((element.originStatus ?? "")).toLowerCase().contains("accepted") ==
            false)
        .toList();
    acceptedOrderList.value = allRequests
        .where((element) =>
            ((element.originStatus ?? "")).toLowerCase().contains("accepted"))
        .toList();
    if (acceptedOrderList.isNotEmpty) {
      getAllSpOrdersAssign(context);
    }
  }

  StatusSort _getOrderStatus(String? status) {
    if (status == null) {
      return StatusSort.todo;
    }

    if (status.toLowerCase() == "accepted") {
      return StatusSort.todo;
    }
    if (status.toLowerCase() == "todo") {
      return StatusSort.todo;
    }
    if (status.toLowerCase() == "cleaning") {
      return StatusSort.cleaning;
    }
    if (status.toLowerCase() == "in_progress") {
      return StatusSort.inProgress;
    }

    if (status.toLowerCase() == "assigned") {
      return StatusSort.assiged;
    }
    if (status.toLowerCase() == "started") {
      return StatusSort.started;
    }
    if (status.toLowerCase() == "completed") {
      return StatusSort.completed;
    }

    return StatusSort.todo;
  }

  void _pendingOrderMapping(List<Result> allpendingRequests) {
    allpendingRequests.sort(
      (a, b) {
        var aRequestCleanServiceCreateDate =
            a.request?.requestCleanServiceCreateDate ?? DateTime.now();
        var bRequestCleanServiceCreateDate =
            b.request?.requestCleanServiceCreateDate ?? DateTime.now();
        return aRequestCleanServiceCreateDate
            .compareTo(bRequestCleanServiceCreateDate);
      },
    );
    pendingOrderList.value = allpendingRequests.map((e) {
      return OrderModel(
        orderID: (e.request?.requestCleanServiceId ?? 0).toString(),
        buildingName: e.property?.propertyName ?? '',
        apartmentName: (e.propertyUnit?.unitNumber ?? 0).toString(),
        floorNumber: (e.propertyUnit?.unitfloorNumber ?? 0).toString(),
        street: '',
        statusSort: StatusSort.inProgress,
        lat: (e.property?.propertylatitude ?? 0).toString(),
        lng: (e.property?.propertylongitude ?? 0).toString(),
        living: (e.propertyUnitDetail?.unitLivingsNumber ?? 0).toString(),
        rooms: (e.propertyUnitDetail?.unitRoomsNumber ?? 0).toString(),
        baths: (e.propertyUnitDetail?.unitBathsNumber ?? 0).toString(),
        beds: (0).toString(), //this we don't have it
        requestCleanServiceId:
            (e.request?.requestCleanServiceId ?? -1).toString(),
        requestCleanServiceDate: (e.request?.requestCleanServiceCreateDate),
      );
    }).toList();
  }

  void _pendingSpOrderAssignMapping(
      List<SpOrderAssignResponseResult> allSpOrdersAssign) {
    var allCurrentAcceptedOrder = acceptedOrderList.value;

    allCurrentAcceptedOrder = allCurrentAcceptedOrder.map((e) {
      var isAssigned = allSpOrdersAssign
          .map((e) => "${e.requestCleanServiceId ?? -1}")
          .contains(e.requestCleanServiceId ?? "-2");
      if (isAssigned) {
        e.isAssigned = true;
      }
      return e;
    }).toList();
    acceptedOrderList.value = allCurrentAcceptedOrder;
  }
}

enum OrderSort { pending, accepted }

enum SortDetailDialog { orders, detailOrders }

enum StatusSort {
  todo,
  inProgress,
  cleaning,
  accepted,
  rejected,
  assiged,
  started,
  completed,
}

extension StatusValue on StatusSort {
  Color get itemContainerColor {
    switch (this) {
      case StatusSort.todo:
        return AppColors.blueColor.withOpacity(0.21);
      case StatusSort.inProgress:
        return AppColors.inProgressContainerColor;
      case StatusSort.cleaning:
        return AppColors.cleaningContainerColor;
      case StatusSort.accepted:
        return AppColors.greenColor.withOpacity(0.2);
      case StatusSort.rejected:
        return Colors.red.withOpacity(0.2);
      case StatusSort.assiged:
        return AppColors.orangeColor.withOpacity(0.4);
      case StatusSort.started:
        return AppColors.blueColor.withOpacity(0.21);
      case StatusSort.completed:
        return AppColors.greenColor.withOpacity(0.4);
    }
  }

  String get itemTitle {
    switch (this) {
      case StatusSort.todo:
        return 'To do'.tr;
      case StatusSort.inProgress:
        return 'In progress'.tr;
      case StatusSort.cleaning:
        return 'Cleaning'.tr;
      case StatusSort.accepted:
        return 'Accepted'.tr;
      case StatusSort.rejected:
        return 'rejected';
      case StatusSort.assiged:
        return "assigned".tr;
      case StatusSort.started:
        return "started".tr;
      case StatusSort.completed:
        return "completed".tr;
    }
  }

  Color get itemTitleColor {
    switch (this) {
      case StatusSort.todo:
        return AppColors.blueColor;
      case StatusSort.inProgress:
        return AppColors.orangeColor;
      case StatusSort.cleaning:
        return AppColors.cleaningTitleColor;
      case StatusSort.accepted:
        return AppColors.greenColor;
      case StatusSort.rejected:
        return Colors.red;
      case StatusSort.assiged:
        return AppColors.orangeColor;
      case StatusSort.started:
        return AppColors.blueColor;
      case StatusSort.completed:
        return AppColors.greenColor;
    }
  }
}
