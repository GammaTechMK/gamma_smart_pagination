// Widget tests for GammaSmartPagination

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';

bool onRefreshCalled = false;
bool onLoadMoreCalled = false;

void main() {
  late Future<void> Function() onLoadMore;
  late Future<void> Function() onRefresh;

  setUp(() {
    onLoadMore = () async {
      onLoadMoreCalled = true;
    };
    onRefresh = () async {
      onRefreshCalled = true;
    };
  });
  group('[WIDGET][GammaSmartPagination]', () {
    testWidgets('- is in the widget tree', (tester) async {
      final gammaSmartPagination = MaterialApp(
        home: Scaffold(
          body: GammaSmartPagination(
            gammaSmartController: GammaController(),
            scrollController: ScrollController(),
            itemCount: 0,
            child: ListView.builder(
              itemCount: 0,
              itemBuilder: (context, index) => const SizedBox(),
            ),
          ),
        ),
      );

      await tester.pumpWidget(gammaSmartPagination);

      expect(find.byType(GammaSmartPagination), findsOneWidget);
    });

    testWidgets('- onRefresh called', (tester) async {
      final List<String> mockItems = List.generate(10, (index) => 'Item $index');
      final SemanticsHandle handle = tester.ensureSemantics();
      final gammaController = GammaController();
      final scrollController = ScrollController();
      final gammaSmartPagination = MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('test appbar')),
          body: Column(
            children: [
              Expanded(
                child: GammaSmartPagination(
                  gammaSmartController: gammaController,
                  scrollController: scrollController,
                  onLoadMore: () => onLoadMore.call(),
                  onRefresh: () => onRefresh.call(),
                  itemCount: mockItems.length,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mockItems.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(mockItems[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(gammaSmartPagination);

      expect(find.byType(GammaSmartPagination), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(10));

      await tester.fling(find.text('Item 0'), const Offset(0.0, 300.0), 1000.0);
      await tester.pump();

      expect(
          tester.getSemantics(find.byType(RefreshProgressIndicator)),
          matchesSemantics(
            label: 'Refresh',
          ));

      await tester.pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(const Duration(seconds: 1)); // finish the indicator settle animation
      await tester.pump(const Duration(seconds: 1)); // finish the indicator hide animation

      expect(onRefreshCalled, true);
      handle.dispose();
    });

    testWidgets('- onLoadMore called', (tester) async {
      final List<String> mockItems = List.generate(10, (index) => 'Item $index');
      final SemanticsHandle handle = tester.ensureSemantics();
      final gammaController = GammaController();
      final scrollController = ScrollController();
      final gammaSmartPagination = MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('test appbar')),
          body: Column(
            children: [
              Expanded(
                child: GammaSmartPagination(
                  gammaSmartController: gammaController,
                  scrollController: scrollController,
                  onLoadMore: () => onLoadMore.call(),
                  onRefresh: () => onRefresh.call(),
                  itemCount: mockItems.length,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mockItems.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(mockItems[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      await tester.pumpWidget(gammaSmartPagination);

      expect(find.byType(GammaSmartPagination), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(10));

      await tester.fling(find.text('Item 0'), const Offset(0.0, -300.0), 1000.0);
      await tester.pump();

      await tester.pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(const Duration(seconds: 1)); // finish the indicator settle animation
      await tester.pump(const Duration(seconds: 1)); // finish the indicator hide animation

      expect(onLoadMoreCalled, true);
      handle.dispose();
    });
  });
}
