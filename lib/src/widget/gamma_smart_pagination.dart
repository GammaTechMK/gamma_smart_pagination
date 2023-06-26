import 'package:flutter/material.dart';
import 'package:gamma_smart_pagination/src/helpers/extensions.dart';

import '../controller/gamma_smart_controller.dart';
import '../controller/smart_controller_status.dart';

class GammaSmartPagination extends StatefulWidget {
  final GammaSmartController gammaSmartController;
  final ScrollController scrollController;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final Future<void> Function()? onLoadMore;
  final Future<void> Function()? onRefresh;
  final int itemCount;
  final Widget? noInitialDataWidget;
  final Widget? noMoreDataWidget;
  final Widget? loadingFailedWidget;
  final Widget? refreshFailedWidget;
  final Widget? loadingIndicator;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  const GammaSmartPagination({
    super.key,
    required this.gammaSmartController,
    required this.scrollController,
    required this.itemBuilder,
    required this.itemCount,
    this.onRefresh,
    this.onLoadMore,
    this.noMoreDataWidget,
    this.loadingFailedWidget,
    this.refreshFailedWidget,
    this.noInitialDataWidget,
    this.loadingIndicator,
    this.separatorBuilder,
  });

  @override
  State<GammaSmartPagination> createState() => _GammaSmartPaginationState();
}

class _GammaSmartPaginationState extends State<GammaSmartPagination> {
  GammaSmartController get _customController => widget.gammaSmartController;
  ScrollController get _scrollController => widget.scrollController;

  static const double _sensitivityFactor = 300.0;
  static const int _throttleDuration = 200;

  final wipedGrayTextColorStyle = TextStyle(color: Colors.grey.shade400);

  @override
  void initState() {
    _scrollController.onBottomReach(
      () {
        if (_customController.shouldLoadMore) {
          onLoadMore();
        }
      },
      sensitivity: _sensitivityFactor,
      throttleDuration: const Duration(milliseconds: _throttleDuration),
    );
    super.initState();
  }

  // call onLoadMore() only when status is idle, loadingComplete, loadingNoMoreItems
  Future<void> onLoadMore() async {
    _customController.setStatus(GammaSmartControllerStatus.loading);
    await widget.onLoadMore?.call();
  }

  Future<void> onRefresh() async {
    _customController.setStatus(GammaSmartControllerStatus.refreshing);
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
      onRefresh: () async => widget.onRefresh?.call(),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.itemCount,
              itemBuilder: (context, index) => widget.itemBuilder(context, index),
              separatorBuilder: (context, index) =>
                  widget.separatorBuilder?.call(context, index) ?? const SizedBox.shrink(),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
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
    if (_customController.status == GammaSmartControllerStatus.loading) {
      return Center(
        child: widget.loadingIndicator ?? const CircularProgressIndicator.adaptive(),
      );
    }

    if (_customController.status == GammaSmartControllerStatus.loadingNoMoreItems) {
      return Center(
        child: widget.noMoreDataWidget ??
            Text(
              'No more items to load',
              style: wipedGrayTextColorStyle,
            ),
      );
    }

    return const SizedBox.shrink();
  }
}
