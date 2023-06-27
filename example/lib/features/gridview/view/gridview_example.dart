import 'package:flutter/material.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

class GridViewExample extends StatefulWidget {
  const GridViewExample({super.key});

  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  final GammaController gammaController = GammaController();
  final ScrollController scrollController = ScrollController();

  final List<String> itemsList = List.generate(10, (index) => '$index');

  Future<void> onLoadMore() async {
    await Future.delayed(const Duration(seconds: 2));
    final newList = List.generate(10, (index) => '${index + itemsList.length}');
    itemsList.addAll(newList);
    gammaController.setNoMoreData();
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    itemsList.clear();
    final newList = List.generate(10, (index) => '$index');
    itemsList.addAll(newList);
    gammaController.setRefreshingCompleted();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Infinite scroll GridView',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GammaSmartPagination(
                gammaSmartController: gammaController,
                scrollController: scrollController,
                onRefresh: () => onRefresh(),
                onLoadMore: () => onLoadMore(),
                itemCount: itemsList.length,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: itemsList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      color: Colors.blueGrey,
                      child: Center(
                        child: Text(
                          '$index',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    gammaController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
