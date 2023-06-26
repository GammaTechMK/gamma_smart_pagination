import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

import '../../shared_services/items_service.dart';
import '../state/second_screen_state.dart';

final secondScreenViewmodelProvider =
    StateNotifierProvider.autoDispose<SecondScreenViewmodel, SecondScreenState>((ref) {
  final itemsService = ref.watch(itemsServiceProvider);
  return SecondScreenViewmodel(itemsService: itemsService);
});

class SecondScreenViewmodel extends StateNotifier<SecondScreenState> {
  final ItemsService itemsService;
  SecondScreenViewmodel({
    required this.itemsService,
    GammaSmartController? hrAppRefreshController,
    ScrollController? scrollController,
  }) : super(
          SecondScreenState(
            hrAppRefreshController: hrAppRefreshController ?? GammaSmartController(),
            scrollController: scrollController ?? ScrollController(),
          ),
        );

  Future<void> init() async {
    state = state.copyWith(isLoading: true);
    final newItemsList = await itemsService.getItems(
      perPage: state.perPage,
      currentItemsLength: state.itemsList.length,
    );
    state = state.copyWith(
      itemsList: newItemsList,
      isLoading: false,
      hasNext: true,
    );
  }

  Future<void> loadMoreItems() async {
    if (!state.hasNext) {
      state.hrAppRefreshController.setNoMoreData();
      return;
    }

    state.hrAppRefreshController.setLoading();

    final newItemsList = await itemsService.getItems(
      perPage: state.perPage,
      currentItemsLength: state.itemsList.length,
    );

    state = state.copyWith(
      itemsList: [...state.itemsList, ...newItemsList],
      hasNext: false,
    );

    state.hrAppRefreshController.setIdle();
  }

  Future<void> refreshItems() async {
    state.hrAppRefreshController.setRefreshing();
    final newItemsList = await itemsService.getItems(
      perPage: state.perPage,
      currentItemsLength: 0,
    );
    state = state.copyWith(
      itemsList: newItemsList,
      hasNext: true,
    );
    state.hrAppRefreshController.setIdle();
  }

  void removeItem(int index) {
    List<String> newItemsList = [...state.itemsList];
    newItemsList.removeAt(index);
    state = state.copyWith(
      itemsList: newItemsList,
    );
  }
}
