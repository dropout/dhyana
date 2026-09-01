import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// ==========================================
// 1. THE CORE INFRASTRUCTURE (InheritedWidget)
// ==========================================

/// The internal InheritedWidget that securely passes the Cubit down the tree.
class CubitScope<C extends Cubit<dynamic>> extends InheritedWidget {
  final C cubit;

  const CubitScope({
    super.key,
    required this.cubit,
    required super.child,
  });

  static C of<C extends Cubit<dynamic>>(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<CubitScope<C>>();
    if (scope == null) {
      throw StateError('No CubitScope found for type $C in the widget tree.');
    }
    return scope.cubit;
  }

  @override
  bool updateShouldNotify(CubitScope<C> oldWidget) => oldWidget.cubit != cubit;
}

// ==========================================
// 2. THE PROVIDER WIDGET
// ==========================================

/// Injects a Cubit from get_it, manages its lifecycle, and exposes it to the tree.
class ProviderWidget<C extends Cubit<dynamic>> extends StatefulWidget {
  final Widget child;
  
  /// Optional parameters to forward to the get_it factory.
  final dynamic param1;
  final dynamic param2;

  const ProviderWidget({
    super.key,
    required this.child,
    this.param1,
    this.param2,
  });

  @override
  State<ProviderWidget<C>> createState() => _ProviderWidgetState<C>();
}

class _ProviderWidgetState<C extends Cubit<dynamic>> extends State<ProviderWidget<C>> {
  late final C _cubit;

  @override
  void initState() {
    super.initState();
    // Resolves the factory instance, forwarding any provided parameters
    _cubit = GetIt.I.get<C>(
      param1: widget.param1,
      param2: widget.param2,
    );
  }

  @override
  void dispose() {
    // Automatically cleans up the Cubit when removed from the tree
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<C>(
      cubit: _cubit,
      child: widget.child,
    );
  }
}

// ==========================================
// 3. THE CONSUMER BASE CLASS
// ==========================================

/// A Riverpod-style base class that automatically rebuilds on state changes.
abstract class ConsumerWidget<C extends Cubit<S>, S> extends StatefulWidget {
  const ConsumerWidget({super.key});

  /// The custom build method exposing context, cubit, and state.
  Widget build(BuildContext context, C cubit, S state);

  /// Optional: Override this in your subclass to optimize rebuilds.
  bool buildWhen(S previous, S current) => true;

  @override
  State<ConsumerWidget<C, S>> createState() => _ConsumerWidgetState<C, S>();
}

/// The private state class that handles the BlocBuilder and lifecycle.
class _ConsumerWidgetState<C extends Cubit<S>, S> extends State<ConsumerWidget<C, S>> {
  @override
  Widget build(BuildContext context) {
    // 1. Look up the injected instance from the ProviderWidget
    final cubit = CubitScope.of<C>(context);

    // 2. Proxy to BlocBuilder to handle reactive rebuilds
    return BlocBuilder<C, S>(
      bloc: cubit, // Bypasses default BlocProvider lookup
      buildWhen: widget.buildWhen,
      builder: (context, state) {
        // 3. Call the custom build method defined on the widget
        return widget.build(context, cubit, state);
      },
    );
  }
}

// ==========================================
// 4. USAGE EXAMPLE
// ==========================================

// --- State & Cubit ---
class ExampleState {
  final String data;
  ExampleState(this.data);
}

class ExampleCubit extends Cubit<ExampleState> {
  final String userId;
  ExampleCubit({required this.userId}) : super(ExampleState('Initial for $userId'));

  void updateData() => emit(ExampleState('Updated for $userId'));
}

// --- Setup (Run this in your main.dart or dependency injection setup) ---
void setupLocator() {
  GetIt.I.registerFactoryParam<ExampleCubit, String, void>(
    (userId, _) => ExampleCubit(userId: userId),
  );
}

// --- Feature Entry Point (Provider) ---
class FeatureScreen extends StatelessWidget {
  final String userId;

  const FeatureScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ExampleCubit>(
      param1: userId, // Forwards to the get_it factory
      child: const Scaffold(
        body: FeatureBody(),
      ),
    );
  }
}

// --- UI Component (Consumer) ---
class FeatureBody extends ConsumerWidget<ExampleCubit, ExampleState> {
  const FeatureBody({super.key});

  // Optional: Optimize rebuilds just like standard flutter_bloc
  @override
  bool buildWhen(ExampleState previous, ExampleState current) {
    return previous.data != current.data;
  }

  // The custom build method exactly as requested
  @override
  Widget build(BuildContext context, ExampleCubit cubit, ExampleState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('State Data: ${state.data}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: cubit.updateData,
            child: const Text('Update State'),
          ),
        ],
      ),
    );
  }
}