import 'package:cloundry_care/util/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyView extends StatelessWidget {
  final String message;
  const EmptyView({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/no_data.svg"),
          const SizedBox(
            height: 15,
          ),
          // Text(
          //   "No Data!".tr,
          //   style: TextStyle(
          //       color: AppColors.greyColor,
          //       fontSize: 20,
          //       fontFamily: GoogleFonts.ubuntu().fontFamily,
          //       fontWeight: FontWeight.w400),
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          Text(
            message,
            style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 20,
                fontFamily: GoogleFonts.ubuntu().fontFamily,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
