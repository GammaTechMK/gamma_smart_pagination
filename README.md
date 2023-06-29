## GammaSmartPagination
Flutter package for implementing infinite scroll pagination, with support for pull to refresh.


[![pub package][pub_badge]][pub_badge_link]
[![pubscore](https://img.shields.io/badge/pubscore-140%2F140-brightgreen)][pub_badge_link]
[![License: MIT][license_badge]][license_badge_link]
<!-- [![popularity](https://img.shields.io/pub/popularity/gamma_smart_pagination?logo=dart)](https://pub.dev/packages/gamma_smart_pagination/score)
[![likes](https://img.shields.io/pub/likes/gamma_smart_pagination?logo=dart)](https://pub.dev/packages/gamma_smart_pagination/score) -->


---

### Table of Contents 

- [Features](#features)
- [Supported platforms](#supported-platforms)
- [Installation](#installation)
- [How to use](#how-to-use)
- [Example app](#example-app)
- [Params](#params)

## Features

1. Pull down to refresh
2. Pull up / scroll to bottom to load more
3. Different controller statuses (loading, refreshing, noMoreData, loadingFailed, refreshingFailed etc...)
4. Widgets to indicate status (no data loaded, errors when refreshing or loading more, no more items to load etc...)

## Supported platforms

* Flutter Android
* Flutter iOS
* Linux (NOT TESTED)
* Windows (NOT TESTED)
* MacOS (NOT TESTED)
* Fuschia (NOT TESTED)

## Installation

Add `gamma_smart_pagination: ^1.0.4` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';
```

## How to use

1. Simply create a `GammaSmartPagination` widget.
2. Wrap it around any scrollable widget (ListView / GridView).
3. Pass it the required `GammaController` and `ScrollController` along with any other available params.

> Tip: Keep in mind that `GammaSmartPagination` is actually a `SingleChildScrollView`, so be mindful to not have unbounded height in the parent widget.
(ListViews wrapped with GammaSmartPagination need to have `shrinkWrap:true` and `NeverScrollableScrollPhysics`.)

```dart
class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  GammaController gammaController = GammaController();
  ScrollController scrollController = ScrollController();

  List<String> itemsList = [];
  bool isLoading = false;

  @override
  void initState() {
    fetchItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamma Smart Pagination Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example screen'),
        ),
        body: SafeArea(
          child: isLoading ? _getLoadingIndicator : _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          // This is the important part:
          child: GammaSmartPagination(
            gammaSmartController: gammaController,
            scrollController: scrollController,
            onLoadMore: () => loadMore(),
            onRefresh: () => refreshItems(),
            itemCount: itemsList.length,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                title: Text(itemsList[index]),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: itemsList.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget get _getLoadingIndicator => const Center(
        child: CircularProgressIndicator(),
      );

  Future<void> fetchItems() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    final fakeItems = List.generate(10, (index) => 'Item ${index + 1}');
    // Update the controller status to completed or failed based on the result
    // If it is the initial request for data, you can use the idle or failed status
    gammaController.setIdle();
    setState(() {
      itemsList = fakeItems;
      isLoading = false;
    });
  }

  Future<void> loadMore() async {
    await Future.delayed(const Duration(seconds: 1));
    final fakeItems = List.generate(10, (index) => 'Item ${itemsList.length + index + 1}');
    // Update the controller status to completed or failed based on the result
    gammaController.setLoadingCompleted();
    setState(() {
      itemsList = [...itemsList, ...fakeItems];
    });
  }

  Future<void> refreshItems() async {
    await Future.delayed(const Duration(seconds: 1));
    final fakeItems = List.generate(10, (index) => 'Item ${index + 1}');
    // Update the controller status to completed or failed based on the result
    gammaController.setRefreshingCompleted();
    setState(() {
      itemsList = fakeItems;
    });
  }

  @override
  void dispose() {
    // Don't forget to dispose the controllers
    gammaController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
```

## Example app
For a full example check out the [Example app](https://github.com/GammaTechMK/gamma_smart_pagination/tree/main/example "Example app")

## Params

```dart

GammaSmartPagination(
  key: const Key('firstScreenInfinitePagination'),
  // Required (for status updates)
  gammaSmartController: GammaController(),
  // Required (for triggering load more when scrolled to bottom)
  scrollController: ScrollController(),
  // The amount of space by which to trigger reload when scroll reaches the end of the list.
  scrollSensitivityTrigger: 200.0,
  // Future<void> Callback when pull to refresh is triggered
  onRefresh: () => refreshItems(),
  // Future<void> Callback when user scrolls to the bottom of the list
  onLoadMore: () => loadMore(),
  // Required
  itemCount: itemsList.length,
  // Required (Usually a ListView or GridView)
  // IMPORTANT:
  // shrinkWrap: true
  // physics: const NeverScrollableScrollPhysics(),
  //
  // This is required because the GammaSmartPagination
  // is a SingleChildScrollView, and any nested scrollable
  // should be NON-scrollable, and shrink wrap set to true
  // where needed
  child: ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: itemsList.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(itemsList[index]),
      );
    }
  ),
  noInitialDataWidget: Text('No data loaded'),
  noMoreDataWidget: Text('No more data to load'),
  loadingFailedWidget: Text('Failed to load more items...'),
  refreshFailedWidget: Text('Failed to refresh data...'),
  loadingIndicator: CircularProgressIndicator.adaptive(),
  // Set to true if you need to have logs in console
  // when loadMore or onRefresh are called
  enableLogging: false,
)
```

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_badge_link]: https://opensource.org/licenses/MIT
[pub_badge]: https://img.shields.io/pub/v/gamma_smart_pagination.svg
[pub_badge_link]: https://pub.dartlang.org/packages/gamma_smart_pagination