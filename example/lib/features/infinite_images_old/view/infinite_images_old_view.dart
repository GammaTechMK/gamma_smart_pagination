import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';
import 'package:smart_pagination_example/features/infinite_images/view/widgets/image_tile.dart';
import 'package:smart_pagination_example/features/infinite_images_old/state/infinite_images_old_state.dart';
import 'package:smart_pagination_example/features/infinite_images_old/viewmodel/infinite_images_old_viewmodel.dart';

class InfiniteImagesOldView extends ConsumerStatefulWidget {
  const InfiniteImagesOldView({super.key});

  @override
  ConsumerState<InfiniteImagesOldView> createState() =>
      _InfiniteImagesViewSOldtate();
}

class _InfiniteImagesViewSOldtate extends ConsumerState<InfiniteImagesOldView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(infiniteImagesOldViewmodelProvider.notifier).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = ref.read(infiniteImagesOldViewmodelProvider.notifier);
    final state = ref.watch(infiniteImagesOldViewmodelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Infinite Images List [shrinkWrap]',
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
    InfiniteImagesOldState state,
    InfiniteImagesOldNotifier viewmodel,
  ) {
    return GammaSmartPagination(
      gammaSmartController: state.gammaController,
      scrollController: state.scrollController,
      onLoadMore: viewmodel.loadMore,
      onRefresh: viewmodel.refreshImages,
      itemCount: state.imagesList.length,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.imagesList.length,
        itemBuilder: (context, index) {
          final imageUrl = state.imagesList[index];
          return ImageTile(imageUrl: imageUrl);
        },
      ),
    );
  }
}
