import 'package:flutter/material.dart';

import 'smart_controller_status.dart';

class GammaSmartController extends ChangeNotifier {
  late GammaSmartControllerStatus _status;

  GammaSmartController() {
    _status = GammaSmartControllerStatus.idle;
  }

  GammaSmartControllerStatus get status => _status;
  String get statusString => _status.toString();

  void setStatus(GammaSmartControllerStatus status) {
    _status = status;
    notifyListeners();
  }
}
