import 'package:flutter_test/flutter_test.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

void main() {
  group('[UNIT] GammaController: ', () {
    test(' - initially the status is IDLE', () {
      final gammaController = GammaController();

      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaIdle>());
    });

    test(' - statusString getter returns the status as a string', () {
      final gammaController = GammaController();

      expect(gammaController.statusString, equals('GammaControllerStatus.idle()'));
    });

    test(' - setIdle() sets the status to IDLE', () {
      final gammaController = GammaController();

      gammaController.setIdle();
      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaIdle>());
    });

    test(' - setRefreshing() sets the status to REFRESHING', () {
      final gammaController = GammaController();

      gammaController.setRefreshing();
      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaRefreshing>());
    });

    test(' - setRefreshingCompleted() sets the status to REFRESHING_COMPLETED', () {
      final gammaController = GammaController();

      gammaController.setRefreshingCompleted();
      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaRefreshingCompleted>());
    });

    test(' - setRefreshingFailed() sets the status to REFRESHING_FAILED', () {
      final gammaController = GammaController();

      gammaController.setRefreshFailed();
      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaRefreshingFailed>());
    });

    test(' - setLoading() sets the status to LOADING', () {
      final gammaController = GammaController();

      gammaController.setLoading();
      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaLoading>());
    });

    test(' - setLoadingCompleted() sets the status to LOADING_COMPLETED', () {
      final gammaController = GammaController();

      gammaController.setLoadingCompleted();
      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaLoadingCompleted>());
    });

    test(' - setLoadingFailed() sets the status to LOADING_FAILED', () {
      final gammaController = GammaController();

      gammaController.setLoadingFailed();
      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaLoadingFailed>());
    });

    test(' - setLoadingFailed() sets the status to LOADING_FAILED with error message', () {
      final gammaController = GammaController();

      gammaController.setLoadingFailed(errorMessage: 'Error');
      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaLoadingFailed>());
      expect(gammaController.status,
          equals(const GammaControllerStatus.loadingFailed(errorMessage: 'Error')));
    });

    test(' - setNoMoreData() sets the status to NO_MORE_DATA', () {
      final gammaController = GammaController();

      gammaController.setNoMoreData();
      expect(gammaController.status, isA<GammaControllerStatus>());
      expect(gammaController.status, isA<GammaNoMoreData>());
    });

    test(' - notifyListeners() notifies the listeners', () {
      final gammaController = GammaController();

      void testListener() {
        expect(gammaController.status, isA<GammaControllerStatus>());
        expect(gammaController.status, isA<GammaIdle>());
      }

      gammaController.addListener(testListener);

      gammaController.setIdle();
    });

    test(' - add listener and check updates', () {
      final gammaController = GammaController();

      void testListener() {
        expect(gammaController.status, const GammaControllerStatus.idle());
      }

      gammaController.attachListener(testListener);

      // detach all listeners
      gammaController.detachListener();

      expect(gammaController.listeners, isEmpty);
    });

    test(' - add and remove listener', () {
      final gammaController = GammaController();

      void testListener() {}

      gammaController.attachListener(testListener);

      expect(gammaController.listeners, isNotEmpty);

      gammaController.detachListener(listener: testListener);

      expect(gammaController.listeners, isEmpty);
    });

    // Test dispose
    test(' - dispose() removes all listeners', () {
      final gammaController = GammaController();

      void testListener() {}

      gammaController.attachListener(testListener);

      expect(gammaController.listeners, isNotEmpty);

      gammaController.dispose();

      expect(gammaController.listeners, isEmpty);
    });
  });
}
