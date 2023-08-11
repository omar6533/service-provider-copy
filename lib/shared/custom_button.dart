// ignore_for_file: deprecated_member_use

import 'package:cloundry_care/util/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Color? titleColor;
  final String title;
  String? icon;
  String? image;
  String? trailingIcon;
  Color? fontColor;
  final VoidCallback onTap;
  final CustomButtonType type;
  TextStyle? style;
  double height;
  double? width;
  Color? containerColor;
  double? borderRadius;
  EdgeInsets? padding;
  CustomButton({
    super.key,
    this.icon,
    this.titleColor,
    this.width,
    this.image,
    this.borderRadius,
    this.containerColor,
    required this.title,
    this.fontColor,
    this.style,
    this.padding,
    this.trailingIcon,
    required this.onTap,
    required this.type,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == CustomButtonType.bordered
              ? Border.all(
                  color: containerColor ?? AppColors.primaryColor,
                )
              : null,
          color: type == CustomButtonType.filled
              ? containerColor ?? AppColors.primaryColor
              : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Image.asset(
                      image!,
                      color: titleColor,
                    ),
                  ),
            image == null
                ? Container()
                : const SizedBox(
                    width: 10,
                  ),
            icon == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: SvgPicture.asset(
                      icon!,
                      color: titleColor,
                    ),
                  ),
            icon == null
                ? Container()
                : const SizedBox(
                    width: 10,
                  ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: style ??
                  Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: titleColor ?? AppColors.whiteColor,
                      ),
            ),
            trailingIcon == null
                ? Container()
                : const SizedBox(
                    width: 10,
                  ),
            trailingIcon == null
                ? Container()
                : SvgPicture.asset(
                    trailingIcon!,
                    color: AppColors.whiteColor,
                  ),
          ],
        ),
      ),
    );
  }
}

enum CustomButtonType {
  filled,
  bordered,
  none,
}
