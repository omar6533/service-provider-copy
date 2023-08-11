// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/constant/app_colors.dart';
import '../controller/signin_controller.dart';
import '../widgets/signin_body.dart';

@RoutePage()
class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  SigninController signinController = Get.put(SigninController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBG,
      body: ResponsiveLayout(
        web: SigninBody(signinController: signinController),
        tablet: SigninBody(signinController: signinController),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await signinController.box.delete(key: currentUserKey);
      signinController.emailController.clear();
      signinController.passwordController.clear();
    });
  }
}
