import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/dashboard/model/service_time_response.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../shared/base_controller.dart';
import '../../../../util/constant/end_points.dart';
import '../../../../util/routes/app_router.gr.dart';
import '../../../network/network_request.dart';
import '../../../network/network_request_body.dart';
import '../../../network/network_service.dart';

class BookingController extends BaseController {
  RxList<ServiceTimeResult> serviceTimeSlotList =
      List<ServiceTimeResult>.of([]).obs;
  Future getAllServiceTime(BuildContext context) async {
    var currentUser = await getCurrentUser();
    await NetworkService().execute(
        const NetworkRequest(
          type: NetworkRequestType.GET,
          path: AppEndPoints.getServiceTimeSlots,
          data: NetworkRequestBody.empty(),
        ), (response) {
      return ServiceTimeSlotResponse.fromJson(response);
    }).then((value) {
      value.when(
        ok: (data) async {
          if (data is ServiceTimeSlotResponse) {
            if (data.status == true) {
              _timeSlotMapping(data.result ?? []);
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

  void _timeSlotMapping(List<ServiceTimeResult> results) {
    serviceTimeSlotList.value = results;
  }
}
