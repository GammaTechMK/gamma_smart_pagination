# GammaSmartPagination
Flutter package for implementing infinite scroll pagination, with support for pull to refresh.
Contains:
* GammaSmartPagination (widget)
* GammaSmartController (controller class for the widget)

## Features

1. Pull down to refresh
2. Pull up / scroll to bottom to load more
3. Different controller statuses (example, loading, refreshing, noMoreData, loadingFailed, refreshingFailed etc...)
4. Widgets to indicate status (example, no data loaded, errors when refreshing or loading more, no more items to load etc...)

## Supported platforms

* Flutter Android
* Flutter iOS
* Flutter web
* Flutter desktop

## Installation

Add `gamma_smart_pagination: ^0.0.1` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';
```

## How to use

Simply create a `GammaSmartPagination` widget, and pass the required params:

```dart
class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  GammaSmartController gammaSmartController = GammaSmartController();
  ScrollController scrollController = ScrollController();

  List<String> itemsList = [];
  bool isLoading = false;

  @override
  void initState() {
    fetchItems();
    super.initState();
  }

  Future<void> fetchItems() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    final fakeItems = List.generate(10, (index) => 'Item ${index + 1}');

    setState(() {
      itemsList = fakeItems;
      isLoading = false;
    });
  }

  Future<void> loadMore() async {
    await Future.delayed(const Duration(seconds: 1));
    final fakeItems = List.generate(10, (index) => 'Item ${itemsList.length + index + 1}');

    setState(() {
      itemsList = [...itemsList, ...fakeItems];
    });
  }

  Future<void> refreshItems() async {
    await Future.delayed(const Duration(seconds: 1));
    final fakeItems = List.generate(10, (index) => 'Item ${index + 1}');

    setState(() {
      itemsList = fakeItems;
    });
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
          child: Column(
            children: [
              Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GammaSmartPagination(
                        gammaSmartController: gammaSmartController,
                        scrollController: scrollController,
                        onLoadMore: () => loadMore(),
                        onRefresh: () => refreshItems(),
                        itemCount: itemsList.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(itemsList[index]),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
```

## Params

```dart

GammaSmartPagination(
  key: const Key('firstScreenInfinitePagination'),
  gammaSmartController: GammaSmartController(),
  scrollController: ScrollController,
  onLoadMore: () => loadMore(),
  onRefresh: () => refreshItems(),
  itemCount: itemsList.length,
  itemBuilder: (context, index) => ListTile(
    title: Text(itemsList[index]),
  ),
  noInitialDataWidget: Text('No data loaded'),
  noMoreDataWidget: Text('No more data to load'),
  loadingFailedWidget: Text('Failed to load more items...'),
  refreshFailedWidget: Text('Failed to refresh data...'),
  loadingIndicator: CircularProgressIndicator.adaptive(),
  separator: const Divider(),
)
```