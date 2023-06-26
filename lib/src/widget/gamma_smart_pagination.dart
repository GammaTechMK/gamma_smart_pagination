import 'package:flutter/material.dart';
import 'package:gamma_smart_pagination/gamma_smart_pagination.dart';
import 'package:gamma_smart_pagination/src/helpers/extensions.dart';

class GammaSmartPagination extends StatefulWidget {
  final GammaSmartController gammaSmartController;
  final ScrollController scrollController;
  final Future<void> Function()? onLoadMore;
  final Future<void> Function()? onRefresh;
  final Widget child;
  final int itemCount;
  final Widget? noInitialDataWidget;
  final Widget? noMoreDataWidget;
  final Widget? loadingFailedWidget;
  final Widget? refreshFailedWidget;
  final Widget? loadingIndicator;
  final bool enableLogging;
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
  GammaSmartController get _customController => widget.gammaSmartController;
  ScrollController get _scrollController => widget.scrollController;

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

  void onBottomReached() {
    // debugPrint(_scrollController.position.toString());
    // Max scroll extent callback
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll >= (maxScroll - _sensitivityFactor)) {
      if (_customController.shouldLoadMore && currentScroll > 0) {
        _logLoadMoreCalled();
        onLoadMore();
      }
    }
  }

  // call onLoadMore() only when status is idle, loadingComplete, loadingNoMoreItems
  Future<void> onLoadMore() async {
    _customController.setLoading();
    await widget.onLoadMore?.call();
  }

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
