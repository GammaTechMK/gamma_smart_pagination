import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

part 'third_screen_state.freezed.dart';

@freezed
class ThirdScreenState with _$ThirdScreenState {
  const factory ThirdScreenState({
    required GammaController hrAppRefreshController,
    required ScrollController scrollController,
    @Default(false) bool isLoading,
    @Default([]) List<String> itemsList,
    @Default(false) bool hasNext,
    @Default(20) int perPage,
  }) = _ThirdScreenState;
}
