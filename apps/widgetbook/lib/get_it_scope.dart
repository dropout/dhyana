import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// Custom wrapper to initialize GetIt state per story
class GetItScope extends StatefulWidget {
  final Widget child;
  final Future<void> Function(GetIt getIt) setupDependencies;

  const GetItScope({
    super.key,
    required this.child,
    required this.setupDependencies,
  });

  @override
  State<GetItScope> createState() => _GetItScopeState();
}

class _GetItScopeState extends State<GetItScope> {

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    widget.setupDependencies(GetIt.instance).then((_) {
      setState(() {
        _isInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const SizedBox.shrink();
    }
    return widget.child;
  }
}