import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

enum NetworkStatus { online, offline }

class NetworkStatusService {
  StreamController<ConnectivityResult> networkStatusController =
      StreamController<ConnectivityResult>();

  final Connectivity _connectivity = Connectivity();

  NetworkStatusService() {
    initConnectivity();

    _connectivity.onConnectivityChanged.listen((event) {
      _updateConnectionStatus(event);
    });
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return _updateConnectionStatus(ConnectivityResult.none);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    networkStatusController.add(result);
  }
}
