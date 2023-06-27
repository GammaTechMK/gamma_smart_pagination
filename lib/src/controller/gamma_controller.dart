import 'package:flutter/material.dart';

import 'gamma_controller_status.dart';

/// A controller to handle the state of the GammaSmartPagination widget.
/// It is used to control the state of the widget and to notify the widget
/// when the state changes
class GammaController extends ChangeNotifier {
  late GammaControllerStatus _status;
  final List<VoidCallback> _listeners = <VoidCallback>[];
  bool _isDisposed = false;

  /// [GammaController] constructor.
  GammaController() {
    _status = const GammaControllerStatus.idle();
  }

  /// add a listener to the controller.
  void attachListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  /// remove a listener from the controller.
  /// @Params: [listener] is the listener to be removed.
  /// If no listener is passed, all listeners will be removed.
  void detachListener({VoidCallback? listener}) {
    if (listener != null) {
      _listeners.remove(listener);
    } else {
      _listeners.clear();
    }
  }

  /// getter for the controller listeners.
  List<VoidCallback> get listeners => _listeners;

  /// Whether any [Listener] objects have attached themselves to the
  /// [GammaController] using the [attachListener] method.
  ///
  /// If this is false, then members that interact with the [GammaControllerStatus],
  /// must not be called.
  bool get hasClients => _listeners.isNotEmpty;

  /// getter for the controller status.
  GammaControllerStatus get status => _status;

  /// getter for the controller status as a string.
  String get statusString => _status.toString();

  /// set the controller status to idle.
  /// Use this method when the widget is first rendered.
  /// And also it can be used after the first load of data is completed.
  void setIdle() {
    _status = const GammaControllerStatus.idle();
    notifyListeners();
  }

  /// set the controller status to loading.
  /// Use this method when the widget is loading more data.
  void setLoading() {
    _status = const GammaControllerStatus.loading();
    notifyListeners();
  }

  /// set the controller status to loadingCompleted.
  /// Use this method when the widget is done loading more data.
  /// But there is still more data to load.
  void setLoadingCompleted() {
    _status = const GammaControllerStatus.loadingCompleted();
    notifyListeners();
  }

  /// set the controller status to loadingFailed.
  /// Use this method when the widget failed to load more data.
  /// @Params: [errorMessage] is the error message that will be displayed in the footer.
  void setLoadingFailed({String? errorMessage}) {
    _status = GammaControllerStatus.loadingFailed(errorMessage: errorMessage);
    notifyListeners();
  }

  /// set the controller status to noMoreData.
  /// Use this method when the widget has loaded all the data.
  /// AND there is no more data to load.
  void setNoMoreData() {
    _status = const GammaControllerStatus.noMoreData();
    notifyListeners();
  }

  /// set the controller status to refreshingFailed.
  /// Use this method when the widget failed to refresh the data.
  void setRefreshFailed() {
    _status = const GammaControllerStatus.refreshingFailed();
    notifyListeners();
  }

  /// set the controller status to refreshing.
  /// Use this method when the widget is refreshing the data.
  void setRefreshing() {
    _status = const GammaControllerStatus.refreshing();
    notifyListeners();
  }

  /// set the controller status to refreshingCompleted.
  /// Use this method when the widget is done refreshing the data.
  void setRefreshingCompleted() {
    _status = const GammaControllerStatus.refreshingCompleted();
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_isDisposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _listeners.clear();
    super.dispose();
  }
}
