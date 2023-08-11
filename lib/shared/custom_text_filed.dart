// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../util/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  double? width;
  String? hintText;
  TextStyle? hintStyle;
  final String title;
  final TextEditingController controller;
  final Function(String) onChanged;
  final TextInputType? keyboardType;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatters;
  CustomTextField({
    Key? key,
    required this.title,
    this.hintStyle,
    this.prefixIcon,
    this.hintText,
    this.width,
    required this.controller,
    required this.onChanged,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title.tr,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.greyColor),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: isArabic ? 0 : 10, right: isArabic ? 10 : 0),
          width: width ?? double.infinity,
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.borderColor)),
          child: TextField(
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            controller: controller,
            onChanged: onChanged,
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle ??
                  Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.textFieldColor,
                      ),
            ),
          ),
        )
      ],
    );
  }
}
