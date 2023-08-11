import 'package:cloundry_care/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../util/constant/app_assets.dart';
import '../util/constant/app_colors.dart';

// ignore: must_be_immutable
class ConnectionLostView extends StatelessWidget {
  String? title;
  ConnectionLostView({super.key, this.title});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 144,
              height: 144,
              child: Lottie.asset(AppAssets.connectionLostAnimation,
                  options: LottieOptions(enableMergePaths: true)),
            ),
            (title ?? '').isEmpty
                ? Container()
                : const SizedBox(
                    height: 16,
                  ),
            (title ?? '').isEmpty
                ? Container()
                : Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 95),
              child: CustomButton(
                height: 40,
                type: CustomButtonType.filled,
                title: 'Try Again'.tr,
                onTap: () {},
              ),
            )
          ],
        ),
      )),
    );
  }
}
