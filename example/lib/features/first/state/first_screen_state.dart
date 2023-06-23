import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

part 'first_screen_state.freezed.dart';

@freezed
class FirstScreenState with _$FirstScreenState {
  const factory FirstScreenState({
    required GammaSmartController hrAppRefreshController,
    required ScrollController scrollController,
    @Default(false) bool isLoading,
    @Default([]) List<String> itemsList,
    @Default(false) bool hasNext,
    @Default(20) int perPage,
  }) = _FirstScreenState;
}
