import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';
import 'package:smart_pagination_example/features/infinite_images/services/infinite_images_service.dart';
import 'package:smart_pagination_example/features/infinite_images/state/infinite_image_state.dart';

final infiniteImagesViewmodelProvider = StateNotifierProvider.autoDispose<
    InfiniteImagesNotifier, InfiniteImagesState>((ref) {
  return InfiniteImagesNotifier(ref.watch(infiniteImagesServiceProvider));
});

class InfiniteImagesNotifier extends StateNotifier<InfiniteImagesState> {
  final InfiniteImagesService _infiniteImagesService;

  InfiniteImagesNotifier(this._infiniteImagesService,
      {GammaController? gammaController, ScrollController? scrollController})
      : super(InfiniteImagesState(
          gammaController: gammaController ?? GammaController(),
          scrollController: scrollController ?? ScrollController(),
        ));

  Future<void> init() async {
    state = state.copyWith(
      isLoading: true,
    );
    final result = await _infiniteImagesService.getImages(0);

    state = state.copyWith(
      imagesList: result,
      isLoading: false,
    );

    state.gammaController.setIdle();
  }

  Future<void> loadMore() async {
    final result =
        await _infiniteImagesService.getImages(state.imagesList.length);

    state.gammaController.setLoadingCompleted();

    state = state.copyWith(
      imagesList: [...state.imagesList, ...result],
    );
  }

  Future<void> refreshImages() async {
    state = state.copyWith(
      isLoading: true,
    );

    final result = await _infiniteImagesService.getImages(0);

    state.gammaController.setRefreshingCompleted();

    state = state.copyWith(
      isLoading: false,
      imagesList: result,
    );
  }
}
