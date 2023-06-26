import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

/// Extension on [GammaSmartController] to check if the controller should load more items.
extension ShouldLoadMore on GammaSmartController {
  /// Returns true if the controller should load more items.
  /// Returns false if the controller is in any of the following states:
  /// - [GammaControllerStatus.loading]
  /// - [GammaControllerStatus.noMoreData]
  /// - [GammaControllerStatus.refreshing]
  bool get shouldLoadMore => status.maybeWhen(
        idle: () => true,
        loadingCompleted: () => true,
        refreshingCompleted: () => true,
        loadingFailed: (errorMsg) => true,
        refreshingFailed: () => true,
        orElse: () => false,
      );
}
