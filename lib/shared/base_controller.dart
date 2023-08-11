import 'dart:convert';

import 'package:cloundry_care/app/modules/signin/model/login_response.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'indefinite_loader.dart';

abstract class BaseController extends GetxController {
  final box = const FlutterSecureStorage();

  get userType => UserType.normal;
  dismissLoaderDialog(BuildContext context) async {
    try {
      Navigator.of(context, rootNavigator: true).pop();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<LoginResponse?> getCurrentUser() async {
    if (await box.containsKey(key: currentUserKey)) {
      var userdata = await box.read(key: currentUserKey) ?? "";

      return LoginResponse.fromJson(
        jsonDecode(
          userdata,
        ),
      );
    }
    return null;
  }

  Future showErrorMsg(String msg) async {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  showLoaderDialog(BuildContext context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black26,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Stack(
            children: const [
              IndefiniteLoader(),
            ],
          ),
        );
      },
    );
  }

  Future showSuccessMsg(String msg) async {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

enum UserType { guest, normal }
