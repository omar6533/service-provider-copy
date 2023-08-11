import 'package:cloundry_care/util/constant/app_assets.dart';
import 'package:cloundry_care/util/constant/app_colors.dart';
import 'package:cloundry_care/util/constant/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../util/constant/app_keys.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.only(
        left: 6,
        right: 31,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(),
          const Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (isArabic) {
                    GetStorage().remove('isArabic');
                    Get.updateLocale(englishLocal);
                  } else {
                    GetStorage().write('isArabic', true);
                    Get.updateLocale(arabicLocal);
                  }
                },
                child: SvgPicture.asset(
                  AppAssets.language,
                  color: AppColors.lightGreenColor,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              SvgPicture.asset(
                AppAssets.notification,
                color: AppColors.lightGreenColor,
              ),
              const SizedBox(
                width: 50,
              ),
              SvgPicture.asset(
                AppAssets.profileIcon,
                color: AppColors.lightGreenColor,
              ),
            ],
          ),
          const SizedBox(
            width: 35,
          ),
        ],
      ),
    );
  }
}
