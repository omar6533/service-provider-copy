import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:cloundry_care/util/constant/app_assets.dart';
import 'package:cloundry_care/util/constant/app_colors.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/responsive_layout.dart';
import 'package:cloundry_care/util/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuBody extends StatefulWidget {
  final DashboardController dashboardController;

  const MenuBody({
    super.key,
    required this.dashboardController,
  });

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class SideBarView extends StatelessWidget {
  final DashboardController dashboardController =
      Get.put(DashboardController());
  SideBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      web: MenuBody(dashboardController: dashboardController),
      tablet: MenuBody(dashboardController: dashboardController),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool hideTitle;
  const SideMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.hideTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: hideTitle
          ? SvgPicture.asset(
              icon,
            )
          : Row(
              children: [
                SvgPicture.asset(
                  icon,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title.tr,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.whiteColor),
                ),
              ],
            ),
    );
  }
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ResponsiveLayout.isMobile(context)
          ? null
          : widget.dashboardController.showMoreSideMenu.stream,
      builder: (context, snapshot) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: widget.dashboardController.showMoreSideMenu.isTrue ? 248 : 100,
          color: AppColors.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: !isArabic ? 12 : 0,
                  right: isArabic ? 12 : 0,
                  top: 52,
                ),
                child: Row(
                  children: [
                    StreamBuilder(
                        stream: ResponsiveLayout.isMobile(context)
                            ? null
                            : widget.dashboardController.showMenuTitle.stream,
                        builder: (context, snapshot) {
                          return SizedBox(
                            child: widget
                                    .dashboardController.showMenuTitle.isTrue
                                ? GestureDetector(
                                    onTap: () {
                                      widget
                                          .dashboardController.showMoreSideMenu
                                          .toggle();
                                      if (widget.dashboardController
                                          .showMoreSideMenu.isTrue) {
                                        Future.delayed(
                                            const Duration(milliseconds: 300),
                                            () {
                                          widget
                                              .dashboardController.showMenuTitle
                                              .toggle();
                                        });
                                      } else {
                                        widget.dashboardController.showMenuTitle
                                            .toggle();
                                      }
                                    },
                                    child: Container(
                                      width: 43,
                                      height: 43,
                                      margin: EdgeInsets.only(
                                        right: isArabic ? 0 : 12,
                                        left: !isArabic ? 0 : 12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.yellowColor,
                                      ),
                                    ),
                                  )
                                : Container(),
                          );
                        }),
                    GestureDetector(
                      onTap: () {
                        widget.dashboardController.showMoreSideMenu.toggle();
                        if (widget
                            .dashboardController.showMoreSideMenu.isTrue) {
                          Future.delayed(const Duration(milliseconds: 300), () {
                            widget.dashboardController.showMenuTitle.toggle();
                          });
                        } else {
                          widget.dashboardController.showMenuTitle.toggle();
                        }
                      },
                      child: StreamBuilder(
                        stream: widget.dashboardController.showMenuTitle.stream,
                        builder: (context, snapshot) {
                          return Text(
                            'Msool.',
                            style:
                                widget.dashboardController.showMenuTitle.isTrue
                                    ? Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(color: AppColors.whiteColor)
                                    : Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: AppColors.whiteColor),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              StreamBuilder(
                  stream: ResponsiveLayout.isMobile(context)
                      ? null
                      : widget.dashboardController.showMenuTitle.stream,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            widget.dashboardController.showMoreSideMenu.isFalse
                                ? 20
                                : 40,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 75,
                          ),
                          // SideMenuItem(
                          //   hideTitle: widget
                          //       .dashboardController.showMenuTitle.isFalse,
                          //   icon: AppAssets.dashboard,
                          //   title: 'Dashboard',
                          //   onTap: () {},
                          // ),
                          // const SizedBox(
                          //   height: 82,
                          // ),
                          SideMenuItem(
                            hideTitle: widget
                                .dashboardController.showMenuTitle.isFalse,
                            icon: AppAssets.requests,
                            title: 'Requests'.tr,
                            onTap: () {
                              context.replaceRoute(const DashboardView());
                            },
                          ),
                          const SizedBox(
                            height: 82,
                          ),
                          SideMenuItem(
                            hideTitle: widget
                                .dashboardController.showMenuTitle.isFalse,
                            icon: AppAssets.cleaner,
                            title: 'Cleaners'.tr,
                            onTap: () {
                              context.replaceRoute(CleanersView());
                            },
                          )
                        ],
                      ),
                    );
                  }),
              const Spacer(),
              StreamBuilder<Object>(
                  stream: widget.dashboardController.showMenuTitle.stream,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: widget.dashboardController.showMenuTitle.isFalse
                            ? 20
                            : 40,
                        right: widget.dashboardController.showMenuTitle.isFalse
                            ? 20
                            : 40,
                        bottom: 52,
                      ),
                      child: SideMenuItem(
                        hideTitle:
                            widget.dashboardController.showMenuTitle.isFalse,
                        icon: AppAssets.logoutIcon,
                        title: 'Logout'.tr,
                        onTap: () {
                          GetStorage().remove(currentUserKey);
                          context.replaceRoute(const SigninView());
                        },
                      ),
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
