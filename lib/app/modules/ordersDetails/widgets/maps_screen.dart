import 'dart:async';
import 'dart:ui' as ui;

import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:cloundry_care/util/constant/app_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  final OrderModel orderModel;
  const MapsScreen({super.key, required this.orderModel});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  BitmapDescriptor? markerIcon;
  final Completer<GoogleMapController> controllerCompleter =
      Completer<GoogleMapController>();
  BitmapDescriptor mapIcon = BitmapDescriptor.defaultMarker;
  late GoogleMapController controller;
  Marker mapMarker = const Marker(markerId: MarkerId(""));
  var cameraPosition = const CameraPosition(target: LatLng(0.0, 0.0), zoom: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        compassEnabled: false,
        buildingsEnabled: true,
        indoorViewEnabled: true,
        mapType: MapType.normal,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        tiltGesturesEnabled: false,
        markers: {mapMarker},
        scrollGesturesEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: cameraPosition,
        minMaxZoomPreference: MinMaxZoomPreference.unbounded,
        onMapCreated: (controller) => controllerCompleter.complete(controller),
        gestureRecognizers: {
          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
        },
      ),
    );
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromSVGAsset(
    BuildContext context,
    String svgAssetLink, {
    Size size = const Size(20, 20),
  }) async {
    return getBytesFromAsset(svgAssetLink, size: size, context: context);
  }

  Future<BitmapDescriptor> getBytesFromAsset(
    String path, {
    Size size = const Size(20, 20),
    required BuildContext context,
  }) async {
    String svgString = await DefaultAssetBundle.of(context).loadString(path);

    final drawableRoot = await svg.fromSvgString(
      svgString,
      'debug: $svgString',
    );
    final ratio = ui.window.devicePixelRatio.ceil();
    final width = size.width.ceil() * ratio;
    final height = size.height.ceil() * ratio;
    final picture = drawableRoot.toPicture(
      size: Size(
        width.toDouble(),
        height.toDouble(),
      ),
    );
    final image = await picture.toImage(width, height);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final uInt8List = byteData?.buffer.asUint8List();
    return uInt8List == null
        ? BitmapDescriptor.defaultMarker
        : BitmapDescriptor.fromBytes(uInt8List);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller = await controllerCompleter.future;
      mapIcon =
          await getBitmapDescriptorFromSVGAsset(context, AppAssets.mapIcon);

      var lat = double.tryParse(widget.orderModel.lat ?? '0') ?? 0;
      var lng = double.tryParse(widget.orderModel.lng ?? '0') ?? 0;

      mapMarker = Marker(
        markerId: MarkerId(widget.orderModel.buildingName ?? '1'),
        onTap: () {},
        position: LatLng(lat, lng),
        icon: mapIcon,
      );
      cameraPosition = CameraPosition(target: LatLng(lat, lng), zoom: 17);
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }
}
