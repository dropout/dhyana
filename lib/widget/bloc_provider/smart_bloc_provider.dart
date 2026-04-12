import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SmartBlocBuilder<S> = Widget Function(BuildContext context, S state);
typedef SmartBlocOnCreate<T> = T Function(BuildContext context);

/// The purpose of this widget is to reduce boilerplate when when building on the
/// bloc's state is immediately required in the current widgets working tree.
class SmartBlocProvider<T extends StateStreamableSource<S>, S> extends StatelessWidget {

  /// [onCreate] is the function that creates the bloc. It is called with the
  /// current [BuildContext] and should return an instance of the bloc.
  /// It's not called in every build, but only when the bloc is first created.
  final SmartBlocOnCreate<T> onCreate;

  /// [builder] is the function that builds the widget tree based on the bloc's
  /// state. It is called with the current [BuildContext] and the bloc's state
  /// whenever the state changes.
  final SmartBlocBuilder<S> builder;

  const SmartBlocProvider({
    required this.onCreate,
    required this.builder,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: onCreate,
      child: Builder(
        builder: (context) => BlocBuilder<T, S>(
          builder: (context, state) => builder(context, state)
        )
      ),
    );
  }
  
}
