import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

part 'infinite_image_state.freezed.dart';

@freezed
class InfiniteImagesState with _$InfiniteImagesState {
  const factory InfiniteImagesState({
    required GammaController gammaController,
    required ScrollController scrollController,
    @Default(false) bool isLoading,
    @Default([]) List<String> imagesList,
  }) = _InfiniteImagesState;
}
