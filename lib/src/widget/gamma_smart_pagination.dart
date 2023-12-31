import 'package:flutter/material.dart';
import '../../gamma_smart_pagination.dart';
import '../helpers/extensions.dart';

/// Wrapper widget for scrollable widgets that enables
/// pull to refresh and infinite scrolling pagination.
class GammaSmartPagination extends StatefulWidget {
  /// Controls for the status of the pagination.
  final GammaController gammaSmartController;

  /// Controls the scroll position of the list internally.
  final ScrollController scrollController;

  /// Callback that will be called when the user scrolls to the bottom of the list.
  final Future<void> Function()? onLoadMore;

  /// Callback that will be called when the user pulls down the list.
  final Future<void> Function()? onRefresh;

  /// Scrollable child widget that will be wrapped by the GammaSmartPagination widget.
  /// It must have physics set to [NeverScrollableScrollPhysics] and shrinkWrap set to true.
  final Widget child;

  /// Number of items in the list.
  final int itemCount;

  /// Widget that will be displayed above the list (header)
  final Widget? header;

  /// Widget that will be displayed when the list is empty.
  final Widget? noInitialDataWidget;

  /// Widget that will be displayed when the list has loaded all the data.
  final Widget? noMoreDataWidget;

  /// Widget that will be displayed when the list failed to load more data.
  final Widget? loadingFailedWidget;

  /// Widget that will be displayed when the list failed to refresh.
  final Widget? refreshFailedWidget;

  /// Widget that will be displayed when the list is loading more data.
  final Widget? loadingIndicator;

  /// The amount of space by which to trigger reload when scroll reaches the end of the list.
  final double? scrollSensitivityTrigger;

  /// Enable logging when set to true.
  final bool enableLogging;

  /// Wrapper for scrollable widgets that enables
  /// pull to refresh and infinite scrolling pagination.
  ///
  /// Typically used as wrapper for [ListView], [GridView].
  ///
  /// Important: The child widget must must have physics set to [NeverScrollableScrollPhysics] and shrinkWrap set to true.
  /// because the [GammaSmartPagination] widget will handle the scrolling internally.
  ///
  /// The optional parameters come with general default widgets, but you can override them with your own widgets.
  const GammaSmartPagination({
    super.key,
    required this.gammaSmartController,
    required this.scrollController,
    required this.child,
    required this.itemCount,
    this.onRefresh,
    this.onLoadMore,
    this.header,
    this.noMoreDataWidget,
    this.loadingFailedWidget,
    this.refreshFailedWidget,
    this.noInitialDataWidget,
    this.loadingIndicator,
    this.scrollSensitivityTrigger,
    this.enableLogging = false,
  });

  @override
  State<GammaSmartPagination> createState() => _GammaSmartPaginationState();
}

class _GammaSmartPaginationState extends State<GammaSmartPagination> {
  /// Controls the status of the pagination.
  GammaController get _customController => widget.gammaSmartController;

  /// Controls the scroll position of the list internally.
  ScrollController get _scrollController => widget.scrollController;

  /// factor to determine if the user has reached the bottom of the list.
  static const double _defaultSensitivityFactor = 200.0;

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
    _scrollController.addListener(_onBottomReached);
    super.initState();
  }

  /// Callback when the user scrolls to the bottom of the list.
  void _onBottomReached() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final sensitivityFactor =
        widget.scrollSensitivityTrigger ?? _defaultSensitivityFactor;

    // If the user has scrolled to the bottom of the list, then call the onLoadMore callback.
    // Additionaly checks the current GammaController status to prevent multiple calls.
    if (currentScroll >= (maxScroll - sensitivityFactor)) {
      if (_customController.shouldLoadMore && currentScroll > 0) {
        _logLoadMoreCalled();
        _onLoadMore();
      }
    }
  }

  /// Callback when the user scrolls to the bottom of the list.
  Future<void> _onLoadMore() async {
    _customController.setLoading();
    await widget.onLoadMore?.call();
    if (_customController.status == const GammaControllerStatus.loading()) {
      _customController.setLoadingCompleted();
    }
  }

  /// Called when the user pulls down the list.
  Future<void> _onRefresh() async {
    _logRefreshCalled();
    _customController.setRefreshing();
    return await widget.onRefresh?.call();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _customController,
      builder: (context, child) {
        return _buildDataWidget();
      },
    );
  }

  RefreshIndicator _buildDataWidget() {
    return RefreshIndicator(
        onRefresh: () async => _onRefresh(),
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(),
              widget.itemCount == 0
                  ? _buildNoInitialDataWidget()
                  : widget.child,
              _buildFooter(),
            ],
          ),
        ));
  }

  Widget _buildNoInitialDataWidget() {
    return widget.noInitialDataWidget ?? SizedBox(
      height: 100,
      child: Center(
        child: Text(
              'No data to show',
              style: wipedGrayTextColorStyle,
            ),
      ),
    );
  }

  Widget _buildHeader() {
    return widget.header ?? const SizedBox.shrink();
  }

  Widget _buildFooter() {
    return _customController.status.maybeWhen(
      loading: () {
        return widget.loadingIndicator ??
            SizedBox(
              height: 60.0,
              child: Center(
                child: widget.loadingIndicator ??
                    const CircularProgressIndicator.adaptive(),
              ),
            );
      },
      noMoreData: () {
        return widget.noMoreDataWidget ??
            Center(
              child: SizedBox(
                height: 60.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No more items to load.',
                    textAlign: TextAlign.center,
                    style: wipedGrayTextColorStyle,
                  ),
                ),
              ),
            );
      },
      loadingFailed: (errorMessage) {
        return Center(
          child: SizedBox(
            height: 60.0,
            child: Align(
              alignment: Alignment.center,
              child: widget.loadingFailedWidget ??
                  Text(
                    errorMessage ?? 'Failed to load more data...',
                    style: errorTextColorStyle,
                  ),
            ),
          ),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
