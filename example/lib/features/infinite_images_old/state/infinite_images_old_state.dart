import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

part 'infinite_images_old_state.freezed.dart';

@freezed
class InfiniteImagesOldState with _$InfiniteImagesOldState {
  const factory InfiniteImagesOldState({
    required GammaController gammaController,
    required ScrollController scrollController,
    @Default(false) bool isLoading,
    @Default([]) List<String> imagesList,
  }) = _InfiniteImagesOldState;
}
