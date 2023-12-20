import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

import '../../shared_services/items_service.dart';
import '../state/third_screen_state.dart';

final thirdScreenViewmodelProvider =
    StateNotifierProvider.autoDispose<ThirdScreenViewmodel, ThirdScreenState>(
        (ref) {
  final itemsService = ref.watch(itemsServiceProvider);
  return ThirdScreenViewmodel(itemsService: itemsService);
});

class ThirdScreenViewmodel extends StateNotifier<ThirdScreenState> {
  final ItemsService itemsService;
  ThirdScreenViewmodel({
    required this.itemsService,
    GammaController? gammaController,
    ScrollController? scrollController,
  }) : super(
          ThirdScreenState(
            gammaController: gammaController ?? GammaController(),
            scrollController: scrollController ?? ScrollController(),
          ),
        );

  Future<void> init() async {
    state = state.copyWith(isLoading: true);
    // Simulate request
    await Future.delayed(const Duration(seconds: 1));

    // Simulate empty response
    state = state.copyWith(
      itemsList: [],
      isLoading: false,
      hasNext: true,
    );
  }

  Future<void> loadMoreItems() async {
    if (!state.hasNext) {
      state.gammaController.setNoMoreData();
      return;
    }

    state.gammaController.setLoading();

    final newItemsList = await itemsService.getItems(
      perPage: state.perPage,
      currentItemsLength: state.itemsList.length,
    );

    state = state.copyWith(
      itemsList: [...state.itemsList, ...newItemsList],
      hasNext: false,
    );

    state.gammaController.setIdle();
  }

  Future<void> refreshItems() async {
    state.gammaController.setRefreshing();
    final newItemsList = await itemsService.getItems(
      perPage: state.perPage,
      currentItemsLength: 0,
    );
    state = state.copyWith(
      itemsList: newItemsList,
      hasNext: true,
    );
    state.gammaController.setIdle();
  }

  void removeItem(int index) {
    List<String> newItemsList = [...state.itemsList];
    newItemsList.removeAt(index);
    state = state.copyWith(
      itemsList: newItemsList,
    );
  }

  @override
  bool updateShouldNotify(ThirdScreenState old, ThirdScreenState current) {
    if (mounted) {
      return super.updateShouldNotify(old, current);
    } else {
      return false;
    }
  }
}
