import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../shared/custom_button.dart';
import '../../../../util/constant/app_assets.dart';
import '../../../../util/constant/app_colors.dart';
import '../../../../util/responsive_layout.dart';
import '../controller/signin_controller.dart';

class SigninBody extends StatelessWidget {
  final SigninController signinController;

  const SigninBody({
    super.key,
    required this.signinController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset(
              AppAssets.cloundryCareBg,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )),
        Expanded(
            flex: 2,
            child: Padding(
              padding: ResponsiveLayout.isTablet(context)
                  ? const EdgeInsets.only(left: 80, right: 80)
                  : const EdgeInsets.only(left: 95, right: 146),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    'Get’s started.'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: AppColors.primaryColor),
                  ),
                  const Spacer(),
                  Container(
                    padding: ResponsiveLayout.isTablet(context)
                        ? const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 32)
                        : const EdgeInsets.symmetric(
                            horizontal: 64, vertical: 32),
                    width: MediaQuery.of(context).size.width,
                    height: 278,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Text(
                                  'Email'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: AppColors.primaryColor),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 48,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.borderColor)),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    signinController
                                        .checkEmailValidation(value);
                                  },
                                  controller: signinController.emailController,
                                  textAlign: TextAlign.justify,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: AppColors.lightGreyColor,
                                    ),
                                    prefixIconConstraints:
                                        const BoxConstraints(minWidth: 55),
                                    border: InputBorder.none,
                                    hintText: 'Enter Your Email'.tr,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: AppColors.textFieldColor,
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                'Password'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: const Color(0xffC7C9D9))),
                              child: StreamBuilder<Object>(
                                  stream: signinController.isVisible.stream,
                                  builder: (context, snapshot) {
                                    return TextField(
                                      obscureText:
                                          signinController.isVisible.isFalse,
                                      onChanged: (value) {
                                        signinController
                                            .checkPasswordalidation(value);
                                      },
                                      controller:
                                          signinController.passwordController,
                                      textAlign: TextAlign.justify,
                                      decoration: InputDecoration(
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            if (signinController
                                                .isVisible.isTrue) {
                                              signinController.isVisible.value =
                                                  false;
                                            } else {
                                              signinController.isVisible.value =
                                                  true;
                                            }
                                          },
                                          child: Icon(
                                            signinController.isVisible.isFalse
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: AppColors.lightGreyColor,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock_outlined,
                                          color: AppColors.lightGreyColor,
                                        ),
                                        prefixIconConstraints:
                                            const BoxConstraints(minWidth: 55),
                                        border: InputBorder.none,
                                        hintText: 'Enter Your Password'.tr,
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: AppColors.textFieldColor,
                                            ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 16),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           StreamBuilder(
                  //             stream: signinController.isChecked.stream,
                  //             builder: (context, snapshot) => GestureDetector(
                  //                 onTap: () {
                  //                   if (signinController.isChecked.isTrue) {
                  //                     signinController.isChecked.value = false;
                  //                     signinController.update();
                  //                   } else {
                  //                     signinController.isChecked.value = true;
                  //                     signinController.update();
                  //                   }
                  //                 },
                  //                 child: signinController.isChecked.isTrue
                  //                     ? Icon(
                  //                         Icons.check_box,
                  //                         size: 16,
                  //                         color: AppColors.lightGreyColor,
                  //                       )
                  //                     : Icon(
                  //                         Icons.check_box_outline_blank,
                  //                         size: 16,
                  //                         color: AppColors.lightGreyColor,
                  //                       )),
                  //           ),
                  //           const SizedBox(
                  //             width: 5,
                  //           ),
                  //           Text(
                  //             'Remember me'.tr,
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .labelMedium
                  //                 ?.copyWith(
                  //                   color: AppColors.lightGreyColor,
                  //                 ),
                  //           ),
                  //         ],
                  //       ),
                  //       GestureDetector(
                  //         onTap: () {},
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(right: 10),
                  //           child: Text(
                  //             'Forgot your Password?'.tr,
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .labelMedium
                  //                 ?.copyWith(
                  //                   color: AppColors.primaryColor,
                  //                 ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const Spacer(),
                  StreamBuilder<Object>(
                      stream: signinController.isSigninValid.stream,
                      builder: (context, snapshot) {
                        return CustomButton(
                          containerColor: signinController.isSigninValid.isTrue
                              ? AppColors.primaryColor
                              : AppColors.lightGreyColor,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: AppColors.whiteColor),
                          height: 60,
                          title: 'Sign in'.tr,
                          onTap: () async {
                            if (signinController.isSigninValid.isTrue) {
                              await signinController.login(context);
                            }
                          },
                          type: CustomButtonType.filled,
                        );
                      }),
                  const Spacer(),
                ],
              ),
            ))
      ],
    );
  }
}
