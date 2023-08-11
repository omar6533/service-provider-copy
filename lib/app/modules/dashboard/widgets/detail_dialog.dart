import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:cloundry_care/app/modules/ordersDetails/widgets/maps_screen.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/responsive_layout.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../shared/custom_button.dart';
import '../../../../util/constant/app_assets.dart';
import '../../../../util/constant/app_colors.dart';
import '../controllers/order_controller.dart';
import 'home_detail.dart';

Future<dynamic> detailDialog(
  BuildContext context,
  OrdersController orderController,
  SortDetailDialog sortDetailDialog,
  OrderModel orderModel,
) {
  List<HomeDetailModel> getDetailList() {
    return [
      HomeDetailModel(
        title: 'rooms'.tr,
        number: orderModel.rooms ?? '',
        description: 'rooms Desc'.tr,
      ),
      // HomeDetailModel(title: 'beds', number: 4),
      HomeDetailModel(
          title: 'bathrooms'.tr,
          number: orderModel.baths ?? '',
          description: 'bathrooms Desc'.tr),
      HomeDetailModel(
          title: 'living rooms'.tr,
          number: orderModel.living ?? '',
          description: 'living rooms Desc'.tr),
    ];
  }

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 40, bottom: 36),
              width: MediaQuery.of(context).size.width / 2,
              height: sortDetailDialog == SortDetailDialog.detailOrders
                  ? MediaQuery.of(context).size.height / 1.3
                  : MediaQuery.of(context).size.height / 1.4,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(30)),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120),
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            autoPlay: true,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              orderController.activeIndex.value = index;
                            },
                            viewportFraction: 1,
                            aspectRatio: 1,
                            height: 300,
                          ),
                          itemCount: orderController.views.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                            ),
                            height: MediaQuery.of(context).size.height / 1.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    orderController.views[itemIndex]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      StreamBuilder(
                          stream: orderController.activeIndex.stream,
                          builder: (context, snapshot) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                    vertical: 1,
                                  ),
                                  child: DotsIndicator(
                                    position: orderController.activeIndex.value,
                                    dotsCount: 3,
                                    decorator: DotsDecorator(
                                        color: AppColors.borderColor,
                                        activeColor: AppColors.blackColor,
                                        spacing: const EdgeInsets.all(2.2)),
                                  ),
                                ),
                              ],
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${'Order ID'.tr} :' +
                                        orderModel.orderID.toString() ??
                                    '',
                                style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 20,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                    fontWeight: FontWeight.w400)),
                            Text(orderModel.buildingName ?? '',
                                style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 20,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                    fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${'apartment number'.tr} : ${orderModel.apartmentName ?? ''}',
                              style: TextStyle(
                                  color: AppColors.lightGreenColor,
                                  fontSize: 22,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Text(
                              '${'floor number'.tr} : ${orderModel.floorNumber ?? ''}',
                              style: TextStyle(
                                  color: AppColors.lightGreenColor,
                                  fontSize: 22,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Text(orderModel.street ?? '',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryColor,
                                    color: AppColors.primaryColor,
                                    fontSize: 14,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                    fontWeight: FontWeight.w400)),
                            ResponsiveLayout.isTablet(context)
                                ? const SizedBox(
                                    height: 20,
                                  )
                                : Container(),
                            Text(
                              DateFormat("dd/MMM/yyyy").format(
                                  orderModel.requestCleanServiceDate ??
                                      DateTime.now()),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.primaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 120, left: 120),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var lat = double.tryParse(
                                            orderModel.lat ?? '0') ??
                                        0;
                                    var lng = double.tryParse(
                                            orderModel.lng ?? '0') ??
                                        0;
                                    orderController.navigateTo(lat, lng);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 3),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        border: Border.all(
                                          color: AppColors.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Go'.tr,
                                            style: TextStyle(
                                                fontFamily: GoogleFonts.ubuntu()
                                                    .fontFamily,
                                                color: AppColors.greyColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            AppAssets.locationPinIcon,
                                            width: 12,
                                            height: 17,
                                          )
                                        ],
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8)),
                              child: MapsScreen(
                                orderModel: orderModel,
                              ), // Set Maps
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 120,
                        ),
                        child: ListView.builder(
                            itemCount: getDetailList().length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (getDetailList().length != index) {
                                return HomeDetail(
                                    homeDetailModel: getDetailList()[index]);
                              }

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total space'.tr,
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 12,
                                          fontFamily:
                                              GoogleFonts.ubuntu().fontFamily,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      '200 m'.tr,
                                      style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 12,
                                          fontFamily:
                                              GoogleFonts.ubuntu().fontFamily,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      sortDetailDialog == SortDetailDialog.orders
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButton(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        height: 44,
                                        type: CustomButtonType.filled,
                                        title: 'Accept'.tr,
                                        onTap: () async {
                                          await orderController
                                              .updateOrderStatus(
                                                  context,
                                                  StatusSort.accepted,
                                                  orderModel);
                                        },
                                        containerColor: AppColors.primaryColor),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    CustomButton(
                                        titleColor: AppColors.primaryColor,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        height: 44,
                                        type: CustomButtonType.bordered,
                                        title: 'Deny'.tr,
                                        onTap: () async {
                                          await orderController
                                              .updateOrderStatus(
                                                  context,
                                                  StatusSort.rejected,
                                                  orderModel);
                                        },
                                        containerColor: AppColors.primaryColor),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                    ]),
              ),
            ),
            isArabic
                ? Positioned(
                    left: 30,
                    top: 30,
                    child: GestureDetector(
                        onTap: () {
                          context.popRoute();
                        },
                        child: SvgPicture.asset(AppAssets.close)),
                  )
                : Positioned(
                    right: 30,
                    top: 30,
                    child: GestureDetector(
                        onTap: () {
                          context.popRoute();
                        },
                        child: SvgPicture.asset(AppAssets.close)),
                  ),
          ],
        ),
      );
    },
  );
}
