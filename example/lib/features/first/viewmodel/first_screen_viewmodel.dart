import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

import '../../shared_services/items_service.dart';
import '../state/first_screen_state.dart';

final firstScreenViewmodelProvider =
    StateNotifierProvider.autoDispose<FirstScreenViewmodel, FirstScreenState>(
        (ref) {
  final itemsService = ref.watch(itemsServiceProvider);
  return FirstScreenViewmodel(
    itemsService: itemsService,
  );
});

class FirstScreenViewmodel extends StateNotifier<FirstScreenState> {
  final ItemsService itemsService;
  FirstScreenViewmodel({
    required this.itemsService,
    GammaController? hrAppRefreshController,
    ScrollController? scrollController,
  }) : super(
          FirstScreenState(
            gammaController: hrAppRefreshController ?? GammaController(),
            scrollController: scrollController ?? ScrollController(),
          ),
        );

  Future<void> init() async {
    state = state.copyWith(isLoading: true);
    final initialItemsList = await itemsService.getItems(
      perPage: state.perPage,
      currentItemsLength: state.itemsList.length,
    );
    state = state.copyWith(
      itemsList: initialItemsList,
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
      hasNext: true,
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
}
