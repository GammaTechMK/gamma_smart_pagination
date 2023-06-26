import 'package:flutter/material.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';
import 'package:gamma_smart_pagination/src/helpers/extensions.dart';

/// [GammaSmartPagination] is a 2 in 1 widget that acts as a wrapper for scrollable widgets.
/// It enables pull to refresh and infinite scrolling pagination.
///
/// Typically used as wrapper for [ListView], [GridView].
///
/// Important: The child widget must must have physics set to [NeverScrollableScrollPhysics] and shrinkWrap set to true.
/// because the [GammaSmartPagination] widget will handle the scrolling internally.
///
/// The optional parameters come with general default widgets, but you can override them with your own widgets.
class GammaSmartPagination extends StatefulWidget {
  /// [GammaSmartController] that will be used to control the status of the pagination.
  final GammaSmartController gammaSmartController;

  /// [ScrollController] that will be used to control the scroll position of the list internally.
  final ScrollController scrollController;

  /// [onLoadMore] is the callback that will be called when the user scrolls to the bottom of the list.
  final Future<void> Function()? onLoadMore;

  /// [onRefresh] is the callback that will be called when the user pulls down the list.
  final Future<void> Function()? onRefresh;

  /// [@required][child] is the scrollable child widget that will be wrapped by the GammaSmartPagination widget.
  final Widget child;

  /// [@required][itemCount] is the number of items in the list.
  final int itemCount;

  /// [noInitialDataWidget] is the widget that will be displayed when the list is empty.
  final Widget? noInitialDataWidget;

  /// [noMoreDataWidget] is the widget that will be displayed when the list has loaded all the data.
  final Widget? noMoreDataWidget;

  /// [loadingFailedWidget] is the widget that will be displayed when the list failed to load more data.
  final Widget? loadingFailedWidget;

  /// [refreshFailedWidget] is the widget that will be displayed when the list failed to refresh.
  final Widget? refreshFailedWidget;

  /// [loadingIndicator] is the widget that will be displayed when the list is loading more data.
  final Widget? loadingIndicator;

  /// [enableLogging] is a boolean that will enable logging when set to true.
  final bool enableLogging;

  /// [GammaSmartPagination] Widget constructor.
  const GammaSmartPagination({
    super.key,
    required this.gammaSmartController,
    required this.scrollController,
    required this.child,
    required this.itemCount,
    this.onRefresh,
    this.onLoadMore,
    this.noMoreDataWidget,
    this.loadingFailedWidget,
    this.refreshFailedWidget,
    this.noInitialDataWidget,
    this.loadingIndicator,
    this.enableLogging = false,
  });

  @override
  State<GammaSmartPagination> createState() => _GammaSmartPaginationState();
}

class _GammaSmartPaginationState extends State<GammaSmartPagination> {
  /// [GammaSmartController] that will be used to control the status of the pagination.
  GammaSmartController get _customController => widget.gammaSmartController;

  /// [ScrollController] that will be used to control the scroll position of the list internally.
  ScrollController get _scrollController => widget.scrollController;

  /// [sensitivityFactor] is the factor that will be used to determine if the user has reached the bottom of the list.
  static const double _sensitivityFactor = 200.0;

  final wipedGrayTextColorStyle = TextStyle(color: Colors.grey.shade400);
  final errorTextColorStyle = TextStyle(color: Colors.red.shade300);

  void _logLoadMoreCalled() {
    if (widget.enableLogging) {
      debugPrint('GammaSmartPagination: loadMore called');
    }
  }

  void _logRefreshCalled() {
    if (widget.enableLogging) {
      debugPrint('GammaSmartPagination: onRefresh called');
    }
  }

  @override
  void initState() {
    _scrollController.addListener(onBottomReached);
    super.initState();
  }

  /// [onBottomReached] is called when the user scrolls to the bottom of the list.
  void onBottomReached() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll >= (maxScroll - _sensitivityFactor)) {
      if (_customController.shouldLoadMore && currentScroll > 0) {
        _logLoadMoreCalled();
        onLoadMore();
      }
    }
  }

  /// [onLoadMore] is called when the user scrolls to the bottom of the list.
  Future<void> onLoadMore() async {
    _customController.setLoading();
    await widget.onLoadMore?.call();
  }

  /// [onRefresh] is called when the user pulls down the list.
  Future<void> onRefresh() async {
    _customController.setRefreshing();
    await widget.onRefresh?.call();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _customController,
      builder: (context, child) {
        return widget.itemCount == 0 ? _buildNoInitialDataWidget() : _buildDataWidget();
      },
    );
  }

  RefreshIndicator _buildDataWidget() {
    return RefreshIndicator(
        onRefresh: () async {
          _logRefreshCalled();
          return widget.onRefresh?.call();
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              widget.itemCount == 0 ? _buildNoInitialDataWidget() : widget.child,
              _buildFooter(),
            ],
          ),
        ));
  }

  _buildNoInitialDataWidget() {
    return Center(
      child: widget.noInitialDataWidget ??
          Text(
            'No data to show',
            style: wipedGrayTextColorStyle,
          ),
    );
  }

  Widget _buildFooter() {
    return _customController.status.maybeWhen(
      loading: () {
        return widget.loadingIndicator ??
            SizedBox(
              height: 60.0,
              child: Center(
                child: widget.loadingIndicator ?? const CircularProgressIndicator.adaptive(),
              ),
            );
      },
      noMoreData: () {
        return Center(
          child: widget.noMoreDataWidget ??
              Text(
                'No more items to load.',
                style: wipedGrayTextColorStyle,
              ),
        );
      },
      loadingFailed: (errorMessage) {
        return Center(
          child: widget.loadingFailedWidget ??
              Text(
                errorMessage ?? 'Failed to load more data...',
                style: errorTextColorStyle,
              ),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
