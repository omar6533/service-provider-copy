// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloundry_care/app/modules/dashboard/model/service_time_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/custom_button.dart';
import '../../../../util/constant/app_colors.dart';

class TimeView extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  ServiceTimeResult? serviceTimeResult;
  TimeView({
    Key? key,
    required this.onTap,
    required this.isSelected,
    this.serviceTimeResult,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(serviceTimeResult?.serviceTimeTitle() ?? '',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: GoogleFonts.ubuntu().fontFamily,
              )),
          CustomButton(
            titleColor:
                isSelected ? AppColors.whiteColor : AppColors.primaryColor,
            width: 95,
            height: 24,
            type: isSelected
                ? CustomButtonType.filled
                : CustomButtonType.bordered,
            title: 'Book'.tr,
            onTap: onTap,
            containerColor: AppColors.primaryColor,
            borderRadius: 4,
            style: TextStyle(
              color: isSelected ? AppColors.whiteColor : AppColors.primaryColor,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.ubuntu().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
