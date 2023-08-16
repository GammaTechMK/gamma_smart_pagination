import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';
import 'package:smart_pagination_example/features/gridview/view/gridview_example.dart';

import '../state/third_screen_state.dart';
import '../viewmodel/third_screen_viewmodel.dart';

class ThirdScreen extends ConsumerStatefulWidget {
  const ThirdScreen({super.key});

  @override
  ConsumerState<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends ConsumerState<ThirdScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(thirdScreenViewmodelProvider.notifier).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(thirdScreenViewmodelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'No data screen',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: state.isLoading
            ? _buildLoadingIndicator()
            : _buildBody(context, state),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildBody(
    BuildContext context,
    ThirdScreenState state,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: GammaSmartPagination(
            gammaSmartController: GammaController(),
            scrollController: ScrollController(),
            itemCount: state.itemsList.length,
            header: Container(
              height: 300,
              color: Colors.orange,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.itemsList.length,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const GridViewExample()));
          },
          child: const Text('GridView example'),
        ),
      ],
    );
  }
}
