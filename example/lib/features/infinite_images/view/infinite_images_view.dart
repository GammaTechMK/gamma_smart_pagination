import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';
import 'package:smart_pagination_example/features/infinite_images/state/infinite_image_state.dart';
import 'package:smart_pagination_example/features/infinite_images/view/widgets/image_tile.dart';
import 'package:smart_pagination_example/features/infinite_images/viewmodel/infinite_images_viewmodel.dart';

class InfiniteImagesView extends ConsumerStatefulWidget {
  const InfiniteImagesView({super.key});

  @override
  ConsumerState<InfiniteImagesView> createState() => _InfiniteImagesViewState();
}

class _InfiniteImagesViewState extends ConsumerState<InfiniteImagesView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(infiniteImagesViewmodelProvider.notifier).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = ref.read(infiniteImagesViewmodelProvider.notifier);
    final state = ref.watch(infiniteImagesViewmodelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Performnt Infinite Images List',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: state.isLoading
            ? _buildLoading()
            : _buildImagesList(state, viewmodel),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildImagesList(
    InfiniteImagesState state,
    InfiniteImagesNotifier viewmodel,
  ) {
    return GammaSmartPagination.performant(
      gammaSmartController: state.gammaController,
      scrollController: state.scrollController,
      onLoadMore: viewmodel.loadMore,
      onRefresh: viewmodel.refreshImages,
      itemCount: state.imagesList.length,
      itemExtent: 300.0,
      itemBuilder: (BuildContext context, int index) {
        final imageUrl = state.imagesList[index];
        return ImageTile(imageUrl: imageUrl);
      },
    );
  }
}
