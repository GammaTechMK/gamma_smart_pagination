import 'package:flutter_riverpod/flutter_riverpod.dart';

final infiniteImagesServiceProvider =
    Provider.autoDispose<InfiniteImagesService>((ref) {
  return InfiniteImagesService();
});

class InfiniteImagesService {
  Future<List<String>> getImages(int lastIndex) async {
    // Simulate network request with random picsum images
    await Future.delayed(const Duration(seconds: 2));

    final List<String> newImagesList = List.generate(
      10,
      (index) => 'https://picsum.photos/seed/${lastIndex + index + 1}/200/300',
    );

    return newImagesList;
  }
}
