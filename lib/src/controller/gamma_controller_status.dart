import 'package:freezed_annotation/freezed_annotation.dart';

part 'gamma_controller_status.freezed.dart';

/// A generic class to represent the status of the [GammaSmartController].
@freezed
class GammaControllerStatus with _$GammaControllerStatus {
  const GammaControllerStatus._();

  /// Idle status.
  const factory GammaControllerStatus.idle() = GammaIdle;

  /// Refreshing status.
  const factory GammaControllerStatus.refreshing() = GammaRefreshing;

  /// Refreshing completed status.
  const factory GammaControllerStatus.refreshingCompleted() = GammaRefreshingCompleted;

  /// Refreshing failed status.
  const factory GammaControllerStatus.refreshingFailed() = GammaRefreshingFailed;

  /// Loading status.
  const factory GammaControllerStatus.loading() = GammaLoading;

  /// Loading completed status. (Used when loading has completed but there is still more data to load)
  const factory GammaControllerStatus.loadingCompleted() = GammaLoadingCompleted;

  /// Loading failed status.
  const factory GammaControllerStatus.loadingFailed({String? errorMessage}) = GammaLoadingFailed;

  /// No more data status. (Used after loading has completed and there is no more data to load)
  const factory GammaControllerStatus.noMoreData() = GammaNoMoreData;
}
