import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

import '../../second/view/second_screen.dart';
import '../state/first_screen_state.dart';
import '../viewmodel/first_screen_viewmodel.dart';

class FirstScreen extends ConsumerStatefulWidget {
  const FirstScreen({super.key});

  @override
  ConsumerState<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends ConsumerState<FirstScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(firstScreenViewmodelProvider.notifier).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = ref.read(firstScreenViewmodelProvider.notifier);
    final state = ref.watch(firstScreenViewmodelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Infinite scroll',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: state.isLoading
            ? _buildLoadingIndicator()
            : _buildBody(
                viewmodel,
                state,
                context,
              ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBody(
    FirstScreenViewmodel viewmodel,
    FirstScreenState state,
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: GammaSmartPagination(
            gammaSmartController: state.hrAppRefreshController,
            scrollController: state.scrollController,
            onRefresh: () => viewmodel.refreshItems(),
            onLoadMore: () => viewmodel.loadMoreItems(),
            itemCount: state.itemsList.length,
            itemBuilder: (context, index) => Dismissible(
              key: Key('${state.itemsList[index]}_smart_pagination_item_key'),
              child: ListTile(
                title: Text(state.itemsList[index]),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SecondScreen(),
              ),
            ),
          },
          child: const Text('Go to screen #2'),
        ),
      ],
    );
  }
}
