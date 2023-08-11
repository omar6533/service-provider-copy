import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

const currentUserKey = "currentUser";

bool get isArabic =>
    GetStorage().read('isArabic') != null &&
    GetStorage().read('isArabic') == true;
bool get isLoginBefore => GetStorage().read('isLoginBefore') ?? false;

void setInLoginBeforeStatus(bool islogin, BuildContext context) {
  GetStorage().write('isLoginBefore', islogin);
}
