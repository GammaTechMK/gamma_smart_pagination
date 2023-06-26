import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

extension ShouldLoadMore on GammaSmartController {
  bool get shouldLoadMore =>
      status == const GammaControllerStatus.idle() ||
      status == const GammaControllerStatus.loadingCompleted();
}
