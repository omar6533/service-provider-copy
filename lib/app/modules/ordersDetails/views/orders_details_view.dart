// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloundry_care/app/modules/dashboard/controllers/order_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/widgets/detail_dialog.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/constant/app_colors.dart';
import '../widgets/order_detail_list_view.dart';

// ignore: must_be_immutable
class OrdersDetailsView extends StatelessWidget {
  OrdersController orderDetailController = Get.put(OrdersController());
  OrdersDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 46,
          right: isArabic
              ? 0
              : ResponsiveLayout.isTablet(context)
                  ? 0
                  : 60,
          left: isArabic
              ? ResponsiveLayout.isTablet(context)
                  ? 0
                  : 60
              : 0,
          bottom: 30),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.whiteColor),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 27,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Apartment'.tr,
                  style: TextStyle(
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.detailTitleColor),
                ),
                Text(
                  'Date'.tr,
                  style: TextStyle(
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.detailTitleColor),
                ),
                Text(
                  'Cleaner'.tr,
                  style: TextStyle(
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.detailTitleColor),
                ),
                Text(
                  'Status'.tr,
                  style: TextStyle(
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.detailTitleColor),
                ),
                Text(
                  'Details'.tr,
                  style: TextStyle(
                      fontFamily: GoogleFonts.ubuntu().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.detailTitleColor),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            StreamBuilder<Object>(
                stream: orderDetailController.assigedOrderList.stream,
                builder: (context, snapshot) {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: ListView.separated(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => OrderDetailListView(
                                orderDetailModel: orderDetailController
                                    .assigedOrderList[index],
                                onTap: () {
                                  detailDialog(
                                      context,
                                      orderDetailController,
                                      SortDetailDialog.detailOrders,
                                      orderDetailController
                                          .assigedOrderList[index]);
                                },
                              ),
                          separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Divider(
                                  thickness: 0.5,
                                ),
                              ),
                          itemCount:
                              orderDetailController.assigedOrderList.length),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
