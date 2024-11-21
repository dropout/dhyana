import 'package:flutter/material.dart';

class StatisticsTabBarView extends StatefulWidget {

  final TabController controller;
  final List<Widget> children;

  const StatisticsTabBarView({
    required this.controller,
    required this.children,
    super.key,
  });

  @override
  State<StatisticsTabBarView> createState() => _StatisticsTabBarViewState();
}

class _StatisticsTabBarViewState extends State<StatisticsTabBarView> {

  TabController? _controller;
  int _currentIndex = 0;
  bool _debugHasScheduledValidChildrenCountCheck = false;
  bool _controllerIsValid = false;


  @override
  void initState() {
    print(widget.controller.length);
    widget.controller.addListener(() {
      if (widget.controller.indexIsChanging) {
        setState(() {
          _currentIndex = widget.controller.index;
        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabController();
    _currentIndex = _controller!.index;
    // if (_pageController == null) {
    //   _pageController = PageController(
    //     initialPage: _currentIndex!,
    //     viewportFraction: widget.viewportFraction,
    //   );
    // } else {
    //   _pageController!.jumpToPage(_currentIndex!);
    // }
  }

  @override
  Widget build(BuildContext context) {
    assert(_debugScheduleCheckHasValidChildrenCount());

    // return const Placeholder();
    return widget.children[_currentIndex];
  }

  void _updateTabController() {
    final TabController? newController = widget.controller ?? DefaultTabController.maybeOf(context);
    assert(() {
      if (newController == null) {
        throw FlutterError(
          'No TabController for ${widget.runtimeType}.\n'
              'When creating a ${widget.runtimeType}, you must either provide an explicit '
              'TabController using the "controller" property, or you must ensure that there '
              'is a DefaultTabController above the ${widget.runtimeType}.\n'
              'In this case, there was neither an explicit controller nor a default controller.',
        );
      }
      return true;
    }());

    if (newController == _controller) {
      return;
    }

    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
    }
    _controller = newController;
    if (_controller != null) {
      _controller!.animation!.addListener(_handleTabControllerAnimationTick);
    }
  }

  void _handleTabControllerAnimationTick() {
    // if (_scrollUnderwayCount > 0 || !_controller!.indexIsChanging) {
    //   return;
    // } // This widget is driving the controller's animation.
    //
    // if (_controller!.index != _currentIndex) {
    //   _currentIndex = _controller!.index;
    //   _warpToCurrentIndex();
    // }
  }

  bool _debugScheduleCheckHasValidChildrenCount() {
    if (_debugHasScheduledValidChildrenCountCheck) {
      return true;
    }
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      _debugHasScheduledValidChildrenCountCheck = false;
      if (!mounted) {
        return;
      }
      assert(() {
        if (_controller!.length != widget.children.length) {
          throw FlutterError(
            "Controller's length property (${_controller!.length}) does not match the "
                "number of children (${widget.children.length}) present in TabBarView's children property.",
          );
        }
        return true;
      }());
    }, debugLabel: 'TabBarView.validChildrenCountCheck');
    _debugHasScheduledValidChildrenCountCheck = true;
    return true;
  }

}
