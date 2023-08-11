import 'package:cloundry_care/shared/base_controller.dart';

class AppValidation extends BaseController {
  bool checkEmailValidation(String email) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return RegExp(pattern).hasMatch(email);
  }

  bool checkIqamaNoValidation(String iqamaNo) {
    if (iqamaNo.length == 10) {
      if (!iqamaNo.trim().startsWith("1") && !iqamaNo.trim().startsWith("2")) {
        return false;
      }
      return true;
    }
    return iqamaNo.trim().isNotEmpty && iqamaNo.length == 10;
  }

  bool checkMobileNumberValidation(String mobileNumber) {
    final text = mobileNumber;
    return (text.trim().isNotEmpty && (text.length == 9));
  }

  bool checkNameValidation(String firstName) {
    return firstName.trim().isNotEmpty;
  }

  bool checkPasswordValidation(String password) {
    return password.trim().isNotEmpty && password.trim().length >= 6;
  }
}
