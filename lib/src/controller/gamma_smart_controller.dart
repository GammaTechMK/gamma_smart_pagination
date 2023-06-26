import 'package:flutter/material.dart';

import 'gamma_controller_status.dart';

/// A controller to handle the state of the GammaSmartPagination widget.
/// It is used to control the state of the widget and to notify the widget
/// when the state changes
class GammaSmartController extends ChangeNotifier {
  late GammaControllerStatus _status;

  /// [GammaSmartController] constructor.
  GammaSmartController() {
    _status = const GammaControllerStatus.idle();
  }

  /// [GammaControllerStatus] getter for the controller status.
  GammaControllerStatus get status => _status;

  /// [statusString] getter for the controller status as a string.
  String get statusString => _status.toString();

  /// [setIdle] method to set the controller status to idle.
  /// Use this method when the widget is first rendered.
  /// And also it can be used after the first load of data is completed.
  void setIdle() {
    _status = const GammaControllerStatus.idle();
    notifyListeners();
  }

  /// [setLoading] method to set the controller status to loading.
  /// Use this method when the widget is loading more data.
  void setLoading() {
    _status = const GammaControllerStatus.loading();
    notifyListeners();
  }

  /// [setLoadingCompleted] method to set the controller status to loadingCompleted.
  /// Use this method when the widget is done loading more data.
  /// But there is still more data to load.
  void setLoadingCompleted() {
    _status = const GammaControllerStatus.loadingCompleted();
    notifyListeners();
  }

  /// [setLoadingFailed] method to set the controller status to loadingFailed.
  /// Use this method when the widget failed to load more data.
  /// @Params: [errorMessage] is the error message that will be displayed in the footer.
  void setLoadingFailed({String? errorMessage}) {
    _status = GammaControllerStatus.loadingFailed(errorMessage: errorMessage);
    notifyListeners();
  }

  /// [setNoMoreData] method to set the controller status to noMoreData.
  /// Use this method when the widget has loaded all the data.
  /// AND there is no more data to load.
  void setNoMoreData() {
    _status = const GammaControllerStatus.noMoreData();
    notifyListeners();
  }

  /// [setRefreshFailed] method to set the controller status to refreshingFailed.
  /// Use this method when the widget failed to refresh the data.
  void setRefreshFailed() {
    _status = const GammaControllerStatus.refreshingFailed();
    notifyListeners();
  }

  /// [setRefreshing] method to set the controller status to refreshing.
  /// Use this method when the widget is refreshing the data.
  void setRefreshing() {
    _status = const GammaControllerStatus.refreshing();
    notifyListeners();
  }

  /// [setRefreshingCompleted] method to set the controller status to refreshingCompleted.
  /// Use this method when the widget is done refreshing the data.
  void setRefreshingCompleted() {
    _status = const GammaControllerStatus.refreshingCompleted();
    notifyListeners();
  }
}
