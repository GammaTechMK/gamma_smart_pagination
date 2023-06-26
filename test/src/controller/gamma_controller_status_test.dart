import 'package:flutter_test/flutter_test.dart';
import 'package:gamma_smart_pagination/src/controller/gamma_controller_status.dart';

void main() {
  group('[UNIT] GammaControllerStatus model:', () {
    test(' - is initialized correctly', () {
      const controllerStatusIdle = GammaControllerStatus.idle();
      const controllerStatusRefreshing = GammaControllerStatus.refreshing();
      const controllerStatusRefreshingCompleted = GammaControllerStatus.refreshingCompleted();
      const controllerStatusRefreshingFailed = GammaControllerStatus.refreshingFailed();
      const controllerStatusLoading = GammaControllerStatus.loading();
      const controllerStatusLoadingCompleted = GammaControllerStatus.loadingCompleted();
      const controllerStatusLoadingFailed = GammaControllerStatus.loadingFailed();
      const controllerStatusLoadingFailedWithMessage =
          GammaControllerStatus.loadingFailed(errorMessage: 'Error');
      const controllerStatusNoMoreData = GammaControllerStatus.noMoreData();

      expect(controllerStatusIdle, isA<GammaControllerStatus>());
      expect(controllerStatusIdle, isA<GammaIdle>());

      expect(controllerStatusRefreshing, isA<GammaControllerStatus>());
      expect(controllerStatusRefreshing, isA<GammaRefreshing>());

      expect(controllerStatusRefreshingCompleted, isA<GammaControllerStatus>());
      expect(controllerStatusRefreshingCompleted, isA<GammaRefreshingCompleted>());

      expect(controllerStatusRefreshingFailed, isA<GammaControllerStatus>());
      expect(controllerStatusRefreshingFailed, isA<GammaRefreshingFailed>());

      expect(controllerStatusLoading, isA<GammaControllerStatus>());
      expect(controllerStatusLoading, isA<GammaLoading>());

      expect(controllerStatusLoadingCompleted, isA<GammaControllerStatus>());
      expect(controllerStatusLoadingCompleted, isA<GammaLoadingCompleted>());

      expect(controllerStatusLoadingFailed, isA<GammaControllerStatus>());
      expect(controllerStatusLoadingFailed, isA<GammaLoadingFailed>());

      expect(controllerStatusLoadingFailedWithMessage, isA<GammaControllerStatus>());
      expect(controllerStatusLoadingFailedWithMessage, isA<GammaLoadingFailed>());
      expect(controllerStatusLoadingFailedWithMessage,
          equals(const GammaControllerStatus.loadingFailed(errorMessage: 'Error')));

      expect(controllerStatusNoMoreData, isA<GammaControllerStatus>());
      expect(controllerStatusNoMoreData, isA<GammaNoMoreData>());
    });
  });
}
