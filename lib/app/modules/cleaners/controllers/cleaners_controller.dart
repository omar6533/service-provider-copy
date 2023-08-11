import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/cleaners/model/add_cleaner_response.dart';
import 'package:cloundry_care/app/modules/cleaners/model/cleaner_response.dart';
import 'package:cloundry_care/app/modules/cleaners/model/get_schedule_for_spEmployee.dart';
import 'package:cloundry_care/app/modules/dashboard/model/service_time_response.dart';
import 'package:cloundry_care/app/network/network_request.dart';
import 'package:cloundry_care/app/network/network_request_body.dart';
import 'package:cloundry_care/app/network/network_service.dart';
import 'package:cloundry_care/shared/base_controller.dart';
import 'package:cloundry_care/util/constant/app_colors.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/constant/app_validation.dart';
import 'package:cloundry_care/util/constant/end_points.dart';
import 'package:cloundry_care/util/routes/app_router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../util/constant/extensions.dart';

class CleanersController extends BaseController {
  RxBool isFiltered = false.obs;
  RxInt currentTimeBooked = (-1).obs;
  RxList<int> activeIndex = List<int>.of([]).obs;
  RxBool allSelected = false.obs;
  RxBool isActivated = false.obs;
  RxInt currentIndexActivated = (-1).obs;
  RxString genderName = ''.obs;
  RxString genderFilterName = ''.obs;
  RxBool isAddCleanerValid = false.obs;
  RxMap currentCleanerItem = {}.obs;
  Rx<DateTime> selectedFilterDate = DateTime.now().obs;
  RxString selectedFilterDateTitle = ''.obs;

  Rx<DateTime> selectedDateTime = DateTime.now().obs;

  RxList<GetOrderAssignScheduleForSpEmployeeResult> assignSpScheduleList =
      List<GetOrderAssignScheduleForSpEmployeeResult>.of([]).obs;

  RxString firstnameErrorText = "".obs;
  RxString lastnameErrorText = "".obs;
  RxString iqamaErrorText = "".obs;
  RxString emailErrorText = "".obs;
  RxString password = "".obs;
  RxString phoneErrorText = "".obs;
  RxString genderErrorText = "".obs;

  Rx<DateTime> selectedScheduleDate = DateTime.now().obs;
  RxList<ServiceTimeResult> selectedTimeService =
      List<ServiceTimeResult>.of([]).obs;

  TextEditingController placeHolderController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController iqamaNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  AppValidation appValidation = AppValidation();
  RxList<int> selectedIndex = List<int>.of([]).obs;
  RxString cleaerTotalItems = "".obs;

  RxList<String> genderList = List<String>.of(['Male'.tr, 'female'.tr]).obs;
  RxList<Map<dynamic, dynamic>> data = List<Map<dynamic, dynamic>>.of([]).obs;
  RxList<Map<dynamic, dynamic>> filterData =
      List<Map<dynamic, dynamic>>.of([]).obs;

  Future addCleaner(BuildContext context) async {
    var currentUser = await getCurrentUser();
    late CleanerResponseResult cleanerResponseResult;
    if (currentCleanerItem.value.isNotEmpty) {
      if (currentCleanerItem['result'] is CleanerResponseResult) {
        cleanerResponseResult =
            currentCleanerItem['result'] as CleanerResponseResult;
      }
    }

    var data = {
      "users": {
        "userId":
            currentCleanerItem.isEmpty ? 0 : cleanerResponseResult.userId ?? -1,
        "userName":
            firstNameController.text.trim() + lastNameController.text.trim(),
        "userFName": firstNameController.text.trim(),
        "userLName": lastNameController.text.trim(),
        "userPhone": "966${phoneNumberController.text.trim()}",
        "userEmail": emailController.text.trim(),
        "userPassword": passwordController.text.trim(),
        "userRoleId": 7,
        "userIsDeteled": true,
        "userCreateDate":
            DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
        "userLastLogin":
            DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
        "userDevicePushToken": "-",
        "userPlatformOS": kIsWeb ? 'web' : 'Ipad'
      },
      "spEmployee": {
        "spEmployeeId": currentCleanerItem.isEmpty
            ? 0
            : cleanerResponseResult.spEmployeeId ?? -1,
        "serviceProviderId": currentUser?.employeeInfo?.serviceProviderId ?? -1,
        "userId": 0,
        "employeeIdDocNumber": int.tryParse(iqamaNoController.text.trim()) ?? 0,
        "employeeDateOfBirth":
            DateFormat('yyyy-MM-ddTHH:mm:ss').format(selectedDateTime.value),
        "employeeGender": genderName.value.trim(),
        "employeeIsActive": true,
        "employeeCreateDate":
            DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
      }
    };

    showLoaderDialog(context);
    await NetworkService().execute(
        NetworkRequest(
          type: currentCleanerItem.isEmpty
              ? NetworkRequestType.POST
              : NetworkRequestType.PUT,
          path: currentCleanerItem.isEmpty
              ? AppEndPoints.registerSpEmployee
              : AppEndPoints.editSpEmployee,
          data: NetworkRequestBody.json(data),
          headers: {'Authorization': 'Bearer ${currentUser?.token ?? ''}'},
        ), (response) {
      return AddCleanerResponse.fromJson(response);
    }).then((value) {
      dismissLoaderDialog(context);
      value.when(
        ok: (data) async {
          if (data is AddCleanerResponse) {
            if (data.status == true) {
              context.popRoute();
              getAllCleaner(context);
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

  String calculateAge(String? dob) {
    if (dob == null) {
      return "";
    }
    try {
      DateTime birthDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(dob);

      int age = getAge(birthDate);
      return age.toString();
    } catch (e) {
      return "";
    }
  }

  void checkAddedCleanerValidation() {
    emailErrorText.value = emailController.text.length > 3
        ? !appValidation.checkEmailValidation(emailController.text)
            ? "Please enter valid email".tr
            : ""
        : "";
    phoneErrorText.value =
        passwordController.text.length > 5 ? "Please password".tr : "";
    iqamaErrorText.value = iqamaNoController.text.length > 3
        ? !appValidation.checkIqamaNoValidation(iqamaNoController.text)
            ? "Please enter valid iqama number".tr
            : ""
        : "";
    firstnameErrorText.value = firstNameController.text.length > 3
        ? !appValidation.checkNameValidation(firstNameController.text)
            ? "Please enter first name".tr
            : ""
        : "";

    lastnameErrorText.value = lastNameController.text.length > 3
        ? !appValidation.checkNameValidation(lastNameController.text)
            ? "Please enter last name".tr
            : ""
        : "";

    phoneErrorText.value = phoneNumberController.text.length > 3
        ? !appValidation.checkMobileNumberValidation(phoneNumberController.text)
            ? "Please enter valid mobile number".tr
            : ""
        : "";

    genderErrorText.value = genderName.value.length > 3
        ? genderName.isEmpty
            ? "Please select the gender".tr
            : ""
        : "";

    isAddCleanerValid.value = appValidation
            .checkEmailValidation(emailController.text) &&
        appValidation.checkIqamaNoValidation(iqamaNoController.text) &&
        appValidation.checkNameValidation(firstNameController.text) &&
        appValidation.checkNameValidation(lastNameController.text) &&
        appValidation.checkMobileNumberValidation(phoneNumberController.text) &&
        passwordController.text.isNotEmpty &&
        genderName.isNotEmpty;
  }

  void clearAddCleanerData() {
    emailController.text = '';
    iqamaNoController.text = '';
    firstNameController.text = '';
    lastNameController.text = '';
    phoneNumberController.text = '';
    genderName.value = '';
    selectedDateTime.value = DateTime.now();
  }

  void editCurrentDate(Map? currentData) {
    if (currentData != null) {
      currentCleanerItem.value = currentData;
      late CleanerResponseResult cleanerResponseResult;
      if (currentCleanerItem['result'] is CleanerResponseResult) {
        cleanerResponseResult =
            currentCleanerItem['result'] as CleanerResponseResult;
      }

      firstNameController.text = (cleanerResponseResult.userFName ?? '');
      lastNameController.text = (cleanerResponseResult.userLName ?? '');
      emailController.text = cleanerResponseResult.userEmail ?? '';
      phoneNumberController.text = '';
      genderName.value = cleanerResponseResult.employeeGender ?? '';
      iqamaNoController.text =
          (cleanerResponseResult.employeeIdDocNumber ?? 0).toString();
      try {
        selectedDateTime.value = DateFormat("yyyy-MM-ddTHH:mm:ss")
            .parse(cleanerResponseResult.employeeDateOfBirth ?? '');
      } catch (e) {
        selectedDateTime.value = DateTime.now();
      }
    } else {
      currentCleanerItem.value = {};
      clearAddCleanerData();
    }
  }

  void filterCleaner() {
    List<Map> filterItemData = data;
    if (placeHolderController.text.isNotEmpty) {
      filterItemData = data.value
          .where((element) => element['Name']
              .toString()
              .toLowerCase()
              .contains(placeHolderController.text.toLowerCase()))
          .toList();
    }
    if (genderFilterName.value.isNotEmpty) {
      filterItemData = filterItemData
          .where((element) => element['Gender']
              .toString()
              .toLowerCase()
              .contains(genderFilterName.value.toLowerCase()))
          .toList();
    }

    if (selectedFilterDateTitle.isNotEmpty) {
      filterItemData = data.value.where((element) {
        try {
          var result = element['result'] as CleanerResponseResult;
          var dob = DateFormat('yyyy-MM-ddTHH:mm:ss')
              .parse(result.employeeDateOfBirth ?? '');
          return selectedDateTime.value.isAfter(dob);
        } catch (e) {
          return true;
        }
      }).toList();
    }

    filterData.value = filterItemData;
  }

  int getAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  Future getAllCleaner(BuildContext context) async {
    var currentUser = await getCurrentUser();
    await NetworkService().execute(
        NetworkRequest(
          type: NetworkRequestType.GET,
          path:
              "${AppEndPoints.getSpEmployee}/${currentUser?.employeeInfo?.serviceProviderId ?? -1}",
          data: const NetworkRequestBody.empty(),
        ), (response) {
      return CleanerResponse.fromJson(response);
    }).then((value) {
      value.when(
        ok: (data) async {
          if (data is CleanerResponse) {
            if (data.status == true) {
              _pendingEmpMapping(data.result ?? []);
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

  Future getScheduleForSpEmployee(
      BuildContext context, Map currentCleanerItem) async {
    CleanerResponseResult? cleanerResponseResult;

    if (currentCleanerItem['result'] is CleanerResponseResult) {
      cleanerResponseResult =
          currentCleanerItem['result'] as CleanerResponseResult;
    }
    await NetworkService().execute(
        NetworkRequest(
          type: NetworkRequestType.GET,
          path:
              "${AppEndPoints.getOrderAssignScheduleForSpEmployee}/${cleanerResponseResult == null ? -1 : (cleanerResponseResult.spEmployeeId ?? -1)}",
          data: const NetworkRequestBody.empty(),
        ), (response) {
      return GetOrderAssignScheduleForSpEmployee.fromJson(response);
    }).then((value) {
      value.when(
        ok: (data) async {
          if (data is GetOrderAssignScheduleForSpEmployee) {
            if (data.status == true) {
              _pendingScheduleForSpEmployee(data.result ?? []);
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

  void resetfilterData() {
    placeHolderController.text = '';
    genderFilterName.value = '';
    selectedFilterDate.value = DateTime.now();
    filterData.value = data;
  }

  Future<void> selectDate(
      BuildContext context, Function(DateTime?) onSelectItems,
      {bool? withValidation}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: isArabic ? arabicLocal : englishLocal,
      initialDate: DateTime(1980),
      firstDate: DateTime(1950),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            drawerTheme: DrawerThemeData(
              backgroundColor: AppColors.primaryColor,
            ),
            cardColor: AppColors.primaryColor,
            primaryColor: AppColors.primaryColor,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDateTime.value) {
      if (withValidation == true) {
        int age = getAge(selectedDateTime.value);
        if (age < 18) {
          showErrorMsg(
              "Please note that the minimum age requried is 18 years or older"
                  .tr);
          return;
        }
        onSelectItems(picked);
        return;
      }
      onSelectItems(picked);
    }
  } //calendar

  Future updateCleanerActivation(
      BuildContext context, final bool isActive, final Map currentItem) async {
    var currentUser = await getCurrentUser();
    if (currentItem.isNotEmpty) {
      late CleanerResponseResult cleanerResponseResult;
      if (currentItem['result'] is CleanerResponseResult) {
        cleanerResponseResult = currentItem['result'] as CleanerResponseResult;
      }

      var data = {
        "users": {
          "userId": cleanerResponseResult.userId ?? -1,
          "userName": cleanerResponseResult.userName ?? '',
          "userFName": cleanerResponseResult.userFName ?? '',
          "userLName": cleanerResponseResult.userLName ?? '',
          "userPhone": cleanerResponseResult.userPhone ?? '',
          "userEmail": cleanerResponseResult.userEmail ?? '',
          "userPassword": cleanerResponseResult.userPassword ?? '',
          "userPassword": "-",
          "userRoleId": 7,
          "userIsDeteled": true,
          "userCreateDate":
              DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
          "userLastLogin":
              DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
          "userDevicePushToken": "-",
          "userPlatformOS": kIsWeb ? 'web' : 'Ipad'
        },
        "spEmployee": {
          "spEmployeeId": cleanerResponseResult.spEmployeeId ?? -1,
          "serviceProviderId":
              currentUser?.employeeInfo?.serviceProviderId ?? -1,
          "userId": cleanerResponseResult.userId ?? -1,
          "employeeIdDocNumber":
              cleanerResponseResult.employeeIdDocNumber ?? -1,
          "employeeDateOfBirth":
              DateFormat('yyyy-MM-ddTHH:mm:ss').format(selectedDateTime.value),
          "employeeGender": cleanerResponseResult.employeeGender ?? '',
          "employeeIsActive": isActive,
          "employeeCreateDate":
              DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
        }
      };

      showLoaderDialog(context);
      await NetworkService().execute(
          NetworkRequest(
            type: NetworkRequestType.PUT,
            path: AppEndPoints.editSpEmployee,
            data: NetworkRequestBody.json(data),
            headers: {'Authorization': 'Bearer ${currentUser?.token ?? ''}'},
          ), (response) {
        return AddCleanerResponse.fromJson(response);
      }).then((value) {
        dismissLoaderDialog(context);
        value.when(
          ok: (data) async {
            if (data is AddCleanerResponse) {
              if (data.status == true) {
                context.popRoute();
                getAllCleaner(context);
              }
            }
          },
          invalidParameters: (message) {
            debugPrint("invalidParameters : $message");
          },
          noAuth: (message) async {
            showErrorMsg(
                'your session has been expired, please login again'.tr);
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
  }

  void _pendingEmpMapping(List<CleanerResponseResult> cleanerResult) {
    List<Map> newDate = [];
    activeIndex.value = [];

    cleaerTotalItems.value = cleanerResult.length.toString();
    for (var index = 0; index < cleanerResult.length; index++) {
      if (cleanerResult.elementAt(index).employeeIsActive == true) {
        activeIndex.add(index);
      }

      newDate.add({
        const Icon(Icons.check_box_outline_blank):
            const Icon(Icons.check_box_outline_blank),
        "id": cleanerResult.elementAt(index).userId ?? -1,
        "#": index + 1,
        "Name": (cleanerResult.elementAt(index).userFName ?? '') +
            (cleanerResult.elementAt(index).userLName ?? ''),
        "Iqama No.": cleanerResult.elementAt(index).employeeIdDocNumber ?? '',
        "Email": cleanerResult.elementAt(index).userEmail ?? '',
        "Phone No.": cleanerResult.elementAt(index).userPhone,
        "Gender": (cleanerResult.elementAt(index).employeeGender ?? ''),
        "Age": calculateAge(cleanerResult.elementAt(index).employeeDateOfBirth),
        "Actived/Deactivated": index,
        '': const Icon(Icons.more_horiz),
        "result": cleanerResult.elementAt(index),
      });
    }
    data.value = newDate;
    filterData.value = newDate;
  }

  void _pendingScheduleForSpEmployee(
      List<GetOrderAssignScheduleForSpEmployeeResult> results) {
    assignSpScheduleList.value = results;
  }
}
