import 'dart:async';

import 'package:flutter/material.dart';

class BackgroundApiCaller<T> {
  final Duration interval;
  final VoidCallback callEvent;
  bool _isTimerActive = false;
  Timer? _timer;

  BackgroundApiCaller({
    required this.interval,
    required this.callEvent,
  });

  void start() {
    if (!_isTimerActive) {
      _timer = Timer.periodic(
        interval,
        (Timer timer) {
          callEvent();
        },
      );
      _isTimerActive = true;
    } else {
      stop();
      start();
    }
  }

  void stop() {
    if (_isTimerActive) {
      try {
        debugPrint("STOP");
        _timer?.cancel();
        _timer = null;
        _isTimerActive = false;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
