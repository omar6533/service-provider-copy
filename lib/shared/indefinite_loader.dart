// loading_overlay.dart
import 'package:cloundry_care/util/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IndefiniteLoader extends StatelessWidget {
  const IndefiniteLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppAssets.loadingAnimation,
          width: 120,
          height: 120,
        ),
      ],
    );
  }
}
