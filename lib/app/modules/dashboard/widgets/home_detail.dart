// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/constant/app_colors.dart';

class HomeDetail extends StatelessWidget {
  final HomeDetailModel homeDetailModel;
  const HomeDetail({
    Key? key,
    required this.homeDetailModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${'Number of'.tr} ${homeDetailModel.title}',
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 16,
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              fontWeight: FontWeight.w400),
        ),
        Text(
          '${homeDetailModel.number} ${homeDetailModel.description}',
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
