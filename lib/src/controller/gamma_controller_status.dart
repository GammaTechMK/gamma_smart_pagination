import 'package:freezed_annotation/freezed_annotation.dart';

part 'gamma_controller_status.freezed.dart';

@freezed
class GammaControllerStatus with _$GammaControllerStatus {
  const GammaControllerStatus._();
  const factory GammaControllerStatus.idle() = GammaIdle;
  const factory GammaControllerStatus.refreshing() = GammaRefreshing;
  const factory GammaControllerStatus.refreshingCompleted() = GammaRefreshingCompleted;
  const factory GammaControllerStatus.refreshingFailed() = GammaRefreshingFailed;
  const factory GammaControllerStatus.loading() = GammaLoading;
  const factory GammaControllerStatus.loadingCompleted() = GammaLoadingCompleted;
  const factory GammaControllerStatus.loadingFailed({String? errorMessage}) = GammaLoadingFailed;
  const factory GammaControllerStatus.noMoreData() = GammaNoMoreData;
}
