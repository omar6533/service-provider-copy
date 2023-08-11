// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloundry_care/app/modules/dashboard/controllers/order_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/custom_button.dart';
import '../../../../util/constant/app_colors.dart';

class OrderDetailListView extends StatelessWidget {
  final OrderModel orderDetailModel;
  final VoidCallback onTap;
  const OrderDetailListView({
    Key? key,
    required this.orderDetailModel,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          orderDetailModel.apartmentName ?? '',
          style: TextStyle(
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              fontSize: 11,
              fontWeight: FontWeight.w300,
              color: AppColors.detailSubTitleColor),
        ),
        Text(
          orderDetailModel.date ?? '',
          style: TextStyle(
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              fontSize: 11,
              fontWeight: FontWeight.w300,
              color: AppColors.detailSubTitleColor),
        ),
        Text(
          orderDetailModel.cleaner ?? '',
          style: TextStyle(
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              fontSize: 11,
              fontWeight: FontWeight.w300,
              color: AppColors.detailSubTitleColor),
        ),
        CustomButton(
          style: TextStyle(
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              fontSize: 10,
              color: orderDetailModel.statusSort.itemTitleColor),
          title: orderDetailModel.statusSort.itemTitle,
          type: CustomButtonType.filled,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          containerColor: orderDetailModel.statusSort.itemContainerColor,
          onTap: () {},
          height: 20,
          borderRadius: 65,
        ),
        CustomButton(
          style: TextStyle(
              fontFamily: GoogleFonts.ubuntu().fontFamily,
              fontSize: 8,
              color: AppColors.darkGreyColor),
          title: 'Show more'.tr,
          type: CustomButtonType.bordered,
          containerColor: AppColors.lightGreyColor,
          onTap: onTap,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 20,
          borderRadius: 65,
        ),
      ],
    );
  }
}
