import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/constant/app_colors.dart';

DataColumn2 textDataColumn(String title) {
  return DataColumn2(
      label: Text(
    title.tr,
    style: TextStyle(
      color: AppColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.ubuntu().fontFamily,
    ),
  ));
}
