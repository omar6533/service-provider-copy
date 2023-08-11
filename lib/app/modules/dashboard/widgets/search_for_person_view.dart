// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../util/constant/app_assets.dart';
import '../../../../util/constant/app_colors.dart';

class SearchForPersonView extends StatelessWidget {
  final SearchForPersonModel searchForPersonModel;
  const SearchForPersonView({
    Key? key,
    required this.searchForPersonModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          searchForPersonModel.cleanerName,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.greyColor,
              ),
        ),
        Row(
          children: [
            Text(
              '${searchForPersonModel.houseNumber}',
              style: TextStyle(
                color: AppColors.yellowColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(AppAssets.homeIcon),
          ],
        )
      ],
    );
  }
}
