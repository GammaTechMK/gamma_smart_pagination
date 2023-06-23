import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';
import 'package:smart_pagination_example/features/third/view/third_screen.dart';

import '../state/second_screen_state.dart';
import '../viewmodel/second_screen_viewmodel.dart';

class SecondScreen extends ConsumerStatefulWidget {
  const SecondScreen({super.key});

  @override
  ConsumerState<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends ConsumerState<SecondScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(secondScreenViewmodelProvider.notifier).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = ref.read(secondScreenViewmodelProvider.notifier);
    final state = ref.watch(secondScreenViewmodelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'No more to load status',
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
    SecondScreenViewmodel viewmodel,
    SecondScreenState state,
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
              onDismissed: (direction) => viewmodel.removeItem(index),
              confirmDismiss: (direction) => showConfirmDismissDialog(context),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              child: ListTile(
                title: Text(state.itemsList[index]),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ThirdScreen(),
            ),
          ),
          child: const Text('Go to screen #3'),
        ),
      ],
    );
  }

  Future<bool> showConfirmDismissDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to remove this item?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    return result;
  }
}
