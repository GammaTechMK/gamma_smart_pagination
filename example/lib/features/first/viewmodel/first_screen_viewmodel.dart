import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

import '../../shared_services/items_service.dart';
import '../state/first_screen_state.dart';

final firstScreenViewmodelProvider =
    StateNotifierProvider.autoDispose<FirstScreenViewmodel, FirstScreenState>((ref) {
  final itemsService = ref.watch(itemsServiceProvider);
  return FirstScreenViewmodel(
    itemsService: itemsService,
  );
});

class FirstScreenViewmodel extends StateNotifier<FirstScreenState> {
  final ItemsService itemsService;
  FirstScreenViewmodel({
    required this.itemsService,
    GammaSmartController? hrAppRefreshController,
    ScrollController? scrollController,
  }) : super(
          FirstScreenState(
            hrAppRefreshController: hrAppRefreshController ?? GammaSmartController(),
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

  void setStatus(GammaSmartControllerStatus status) {
    state.hrAppRefreshController.setStatus(status);
  }

  Future<void> loadMoreItems() async {
    if (!state.hasNext) {
      setStatus(GammaSmartControllerStatus.loadingNoMoreItems);
      return;
    }

    debugPrint('loadMoreItems called ...');

    setStatus(GammaSmartControllerStatus.loading);

    final newItemsList = await itemsService.getItems(
      perPage: state.perPage,
      currentItemsLength: state.itemsList.length,
    );

    state = state.copyWith(
      itemsList: [...state.itemsList, ...newItemsList],
      hasNext: true,
    );

    setStatus(GammaSmartControllerStatus.idle);
  }

  Future<void> refreshItems() async {
    setStatus(GammaSmartControllerStatus.refreshing);
    final newItemsList = await itemsService.getItems(
      perPage: state.perPage,
      currentItemsLength: 0,
    );
    state = state.copyWith(
      itemsList: newItemsList,
      hasNext: true,
    );
    setStatus(GammaSmartControllerStatus.idle);
  }

  void removeItem(int index) {
    List<String> newItemsList = [...state.itemsList];
    newItemsList.removeAt(index);
    state = state.copyWith(
      itemsList: newItemsList,
    );
  }
}
