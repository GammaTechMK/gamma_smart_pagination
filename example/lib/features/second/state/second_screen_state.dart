import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

part 'second_screen_state.freezed.dart';

@freezed
class SecondScreenState with _$SecondScreenState {
  const factory SecondScreenState({
    required GammaController gammaController,
    required ScrollController scrollController,
    @Default(false) bool isLoading,
    @Default([]) List<String> itemsList,
    @Default(false) bool hasNext,
    @Default(20) int perPage,
  }) = _SecondScreenState;
}
