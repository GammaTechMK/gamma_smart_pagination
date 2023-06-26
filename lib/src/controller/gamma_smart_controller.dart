import 'package:flutter/material.dart';

import 'gamma_controller_status.dart';

class GammaSmartController extends ChangeNotifier {
  late GammaControllerStatus _status;

  GammaSmartController() {
    _status = const GammaControllerStatus.idle();
  }

  GammaControllerStatus get status => _status;
  String get statusString => _status.toString();

  void setIdle() {
    _status = const GammaControllerStatus.idle();
    notifyListeners();
  }

  void setLoading() {
    _status = const GammaControllerStatus.loading();
    notifyListeners();
  }

  void setLoadingCompleted() {
    _status = const GammaControllerStatus.loadingCompleted();
    notifyListeners();
  }

  void setLoadingFailed({String? errorMessage}) {
    _status = GammaControllerStatus.loadingFailed(errorMessage: errorMessage);
    notifyListeners();
  }

  void setNoMoreData() {
    _status = const GammaControllerStatus.noMoreData();
    notifyListeners();
  }

  void setRefreshFailed() {
    _status = const GammaControllerStatus.refreshingFailed();
    notifyListeners();
  }

  void setRefreshing() {
    _status = const GammaControllerStatus.refreshing();
    notifyListeners();
  }

  void setRefreshingCompleted() {
    _status = const GammaControllerStatus.refreshingCompleted();
    notifyListeners();
  }
}
