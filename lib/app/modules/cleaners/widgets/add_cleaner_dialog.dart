// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/cleaners/controllers/cleaners_controller.dart';
import 'package:cloundry_care/util/constant/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_text_filed.dart';
import '../../../../util/constant/app_assets.dart';
import '../../../../util/constant/app_colors.dart';
import '../../../../util/constant/app_keys.dart';

Future<dynamic> addCleanerDialog(
  BuildContext context,
  CleanersController cleanersController, {
  Map? currentItem,
}) {
  if (currentItem != null) {
    cleanersController.editCurrentDate(currentItem);
  } else {
    cleanersController.editCurrentDate(null);
  }
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                  left: 84, right: 84, top: 20, bottom: 43),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 1.3,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 51,
                      ),
                      CustomTextField(
                          keyboardType: TextInputType.name,
                          controller: cleanersController.firstNameController,
                          onChanged: (p0) {
                            cleanersController.checkAddedCleanerValidation();
                          },
                          title: 'First Name'.tr),
                      StreamBuilder(
                          stream: cleanersController.firstnameErrorText.stream,
                          builder: (context, snapshot) {
                            return cleanersController.firstnameErrorText.isEmpty
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        cleanersController
                                            .firstnameErrorText.string,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: Colors.red,
                                            ),
                                      ),
                                    ],
                                  );
                          }),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomTextField(
                          keyboardType: TextInputType.name,
                          controller: cleanersController.lastNameController,
                          onChanged: (p0) {
                            cleanersController.checkAddedCleanerValidation();
                          },
                          title: 'Last Name'.tr),
                      StreamBuilder(
                          stream: cleanersController.lastnameErrorText.stream,
                          builder: (context, snapshot) {
                            return cleanersController.lastnameErrorText.isEmpty
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        cleanersController
                                            .lastnameErrorText.string,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: Colors.red,
                                            ),
                                      ),
                                    ],
                                  );
                          }),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: cleanersController.iqamaNoController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        onChanged: (p0) {
                          cleanersController.checkAddedCleanerValidation();
                        },
                        title: 'Iqama No.'.tr,
                      ),
                      StreamBuilder(
                          stream: cleanersController.iqamaErrorText.stream,
                          builder: (context, snapshot) {
                            return cleanersController.iqamaErrorText.isEmpty
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        cleanersController
                                            .iqamaErrorText.string,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: Colors.red,
                                            ),
                                      ),
                                    ],
                                  );
                          }),
                      const SizedBox(
                        height: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Date of Birth'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.greyColor),
                            ),
                          ),
                          StreamBuilder<Object>(
                              stream:
                                  cleanersController.selectedDateTime.stream,
                              builder: (context, snapshot) {
                                return GestureDetector(
                                  onTap: () {
                                    cleanersController.selectDate(
                                      context,
                                      (dateSelected) {
                                        cleanersController
                                                .selectedDateTime.value =
                                            dateSelected ?? DateTime.now();
                                      },
                                    );
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      width: double.infinity,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.borderColor)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RotatedBox(
                                            quarterTurns: isArabic ? 2 : 0,
                                            child: Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              color: AppColors.greyColor,
                                              size: 18,
                                            ),
                                          ),
                                          Text(
                                            DateFormat(
                                                    'dd/MMM/yyyy',
                                                    isArabic
                                                        ? arabicLocal
                                                            .languageCode
                                                        : englishLocal
                                                            .languageCode)
                                                .format(cleanersController
                                                    .selectedDateTime.value)
                                                .toString()
                                                .tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  color:
                                                      AppColors.textFieldColor,
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: AppColors.greyColor,
                                            size: 18,
                                          ),
                                        ],
                                      )),
                                );
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Gender'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: AppColors.greyColor),
                        ),
                      ),
                      StreamBuilder<Object>(
                          stream: cleanersController.genderName.stream,
                          builder: (context, snapshot) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              width: double.infinity,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: AppColors.borderColor)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: SvgPicture.asset(
                                      AppAssets.arrowDown,
                                      color: AppColors.greyColor,
                                      width: 16,
                                      height: 7,
                                    ),
                                  ),
                                  iconSize: 16,
                                  isDense: true,
                                  hint: SizedBox(
                                    // width: width,
                                    child: Text(
                                        cleanersController.genderName.isEmpty
                                            ? 'Gender'.tr
                                            : cleanersController
                                                .genderName.value,
                                        style: cleanersController
                                                .genderName.isEmpty
                                            ? Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                  color: AppColors
                                                      .textFieldColor
                                                      .withOpacity(0.5),
                                                )
                                            : Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(
                                                    color:
                                                        AppColors.blackColor)),
                                  ),
                                  onChanged: (value) {
                                    cleanersController.genderName.value =
                                        value ?? "";
                                  },
                                  items: cleanersController.genderList
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            );
                          }),
                      StreamBuilder(
                          stream: cleanersController.genderErrorText.stream,
                          builder: (context, snapshot) {
                            return cleanersController.genderErrorText.isEmpty
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        cleanersController
                                            .genderErrorText.string,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: Colors.red,
                                            ),
                                      ),
                                    ],
                                  );
                          }),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: cleanersController.emailController,
                          onChanged: (p0) {
                            cleanersController.checkAddedCleanerValidation();
                          },
                          title: 'Email'.tr),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomTextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: cleanersController.passwordController,
                          onChanged: (p0) {
                            cleanersController.checkAddedCleanerValidation();
                          },
                          title: 'Password'.tr),
                      StreamBuilder(
                          stream: cleanersController.emailErrorText.stream,
                          builder: (context, snapshot) {
                            return cleanersController.emailErrorText.isEmpty
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        cleanersController
                                            .emailErrorText.string,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: Colors.red,
                                            ),
                                      ),
                                    ],
                                  );
                          }),
                      const SizedBox(
                        height: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Phone Number'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.greyColor),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 96,
                                height: 48,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: AppColors.borderColor)),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.saFlag,
                                      width: 30,
                                      height: 20,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      '+996',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: AppColors.textFieldColor,
                                          ),
                                    )
                                  ],
                                )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: isArabic ? 0 : 10,
                                      right: isArabic ? 10 : 0,
                                      bottom: 15),
                                  height: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.borderColor)),
                                  child: Center(
                                    child: TextField(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(9)
                                      ],
                                      keyboardType: TextInputType.phone,
                                      controller: cleanersController
                                          .phoneNumberController,
                                      onChanged: (p0) {
                                        cleanersController
                                            .checkAddedCleanerValidation();
                                      },
                                      textAlign: TextAlign.justify,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      StreamBuilder(
                          stream: cleanersController.phoneErrorText.stream,
                          builder: (context, snapshot) {
                            return cleanersController.phoneErrorText.isEmpty
                                ? Container()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        cleanersController
                                            .phoneErrorText.string,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: Colors.red,
                                            ),
                                      ),
                                    ],
                                  );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StreamBuilder<Object>(builder: (context, snapshot) {
                            return CustomButton(
                                borderRadius: 4,
                                titleColor: AppColors.primaryColor,
                                width: MediaQuery.of(context).size.width / 7.5,
                                height: 48,
                                type: CustomButtonType.bordered,
                                title: 'Cancel'.tr,
                                onTap: () {
                                  context.popRoute();
                                  cleanersController.clearAddCleanerData();
                                },
                                containerColor: AppColors.primaryColor);
                          }),
                          const SizedBox(
                            width: 10,
                          ),
                          StreamBuilder<Object>(
                              stream:
                                  cleanersController.isAddCleanerValid.stream,
                              builder: (context, snapshot) {
                                return CustomButton(
                                    borderRadius: 4,
                                    titleColor: cleanersController
                                            .isAddCleanerValid.isTrue
                                        ? AppColors.whiteColor
                                        : AppColors.primaryColor,
                                    width:
                                        MediaQuery.of(context).size.width / 7.5,
                                    height: 48,
                                    type: cleanersController
                                            .isAddCleanerValid.isTrue
                                        ? CustomButtonType.filled
                                        : CustomButtonType.bordered,
                                    title: currentItem != null
                                        ? 'Update'.tr
                                        : 'Add Cleaner'.tr,
                                    onTap: () {
                                      if (cleanersController
                                          .isAddCleanerValid.isTrue) {
                                        cleanersController.addCleaner(context);
                                      } else {
                                        cleanersController
                                            .checkAddedCleanerValidation();
                                      }
                                    },
                                    containerColor: AppColors.primaryColor);
                              }),
                        ],
                      )
                    ]),
              ),
            ),
            isArabic
                ? Positioned(
                    left: 30,
                    top: 30,
                    child: GestureDetector(
                        onTap: () {
                          context.popRoute();
                          cleanersController.clearAddCleanerData();
                        },
                        child: SvgPicture.asset(AppAssets.close)),
                  )
                : Positioned(
                    right: 30,
                    top: 30,
                    child: GestureDetector(
                        onTap: () {
                          context.popRoute();
                          cleanersController.clearAddCleanerData();
                        },
                        child: SvgPicture.asset(AppAssets.close)),
                  ),
          ],
        ),
      );
    },
  );
}
