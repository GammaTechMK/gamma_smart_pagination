import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

extension BottomReachExtension on ScrollController {
  void onBottomReach(
    VoidCallback callback, {
    double sensitivity = 200.0,
    Duration throttleDuration = const Duration(milliseconds: 200),
  }) {
    final duration = throttleDuration;
    Timer? timer;

    addListener(() {
      if (timer != null) {
        return;
      }

      // Destroy the timer if it exists
      timer = Timer(duration, () => timer = null);

      // Max scroll extent callback
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels;
      if (maxScroll - currentScroll <= sensitivity) {
        callback();
      }
    });
  }
}

extension ShouldLoadMore on GammaSmartController {
  bool get shouldLoadMore =>
      status == GammaSmartControllerStatus.idle ||
      status == GammaSmartControllerStatus.loadingCompleted ||
      status == GammaSmartControllerStatus.loadingNoMoreItems;
}
