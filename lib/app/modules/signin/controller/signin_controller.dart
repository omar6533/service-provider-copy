import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/signin/model/login_response.dart';
import 'package:cloundry_care/app/network/network_request.dart';
import 'package:cloundry_care/app/network/network_request_body.dart';
import 'package:cloundry_care/app/network/network_service.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/constant/end_points.dart';
import 'package:cloundry_care/util/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/base_controller.dart';

class SigninController extends BaseController {
  RxBool isChecked = false.obs;
  RxBool isVisible = false.obs;
  RxBool isValidEmail = false.obs;
  RxBool isVaildPassword = false.obs;
  RxBool isSigninValid = false.obs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  void checkEmailValidation(String email) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    isValidEmail.value = RegExp(pattern).hasMatch(emailController.text);
    signinValidation();
  }

  void checkPasswordalidation(String password) {
    isVaildPassword.value = passwordController.text.isNotEmpty &&
        passwordController.text.length >= 6;
    signinValidation();
  }

  Future login(BuildContext context) async {
    showLoaderDialog(context);
    await NetworkService().execute(
        NetworkRequest(
          type: NetworkRequestType.POST,
          path: AppEndPoints.login,
          data: NetworkRequestBody.json(
            {
              "email": emailController.text,
              "password": passwordController.text,
            },
          ),
        ), (response) {
      return LoginResponse.fromJson(response);
    }).then((value) {
      dismissLoaderDialog(context);
      value.when(
        ok: (data) async {
          if (data is LoginResponse) {
            if (data.status == true) {
              var userEncoded = jsonEncode(data.toJson());
              await box
                  .write(key: currentUserKey, value: userEncoded)
                  .then((value) {
                context.replaceRoute(const DashboardView());
              });
            } else {
              showErrorMsg(data.messageError);
            }
          }
        },
        invalidParameters: (message) {
          debugPrint("invalidParameters : $message");
        },
        noAuth: (message) {
          debugPrint("noAuth : $message");
        },
        noAccess: (message) {
          debugPrint("noAccess : $message");
        },
        badRequest: (message) async {
          debugPrint("badRequest : $message");
          await showErrorMsg(
            'incorrect email/ password please try again.'.tr,
          );
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

  void signinValidation() {
    isSigninValid.value = isValidEmail.isTrue && isVaildPassword.isTrue;
  }
}
