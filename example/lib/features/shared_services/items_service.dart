import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemsServiceProvider = Provider<ItemsService>((ref) {
  return ItemsServiceImpl();
});

abstract class ItemsService {
  Future<List<String>> getItems({int perPage = 10, int currentItemsLength = 0});
}

class ItemsServiceImpl implements ItemsService {
  @override
  Future<List<String>> getItems(
      {int perPage = 10, int currentItemsLength = 0}) async {
    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));
    final List<String> newItemsList = List.generate(
      perPage,
      (index) => 'Item ${currentItemsLength + index + 1}',
    );

    return newItemsList;
  }
}
