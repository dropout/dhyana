import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SmartBlocBuilder<S> = Widget Function(BuildContext context, S state);
typedef SmartBlocOnCreate<T> = T Function(BuildContext context);

/// The purpose of this widget is to reduce boilerplate when when building on the
/// bloc's state is immediately required in the current widgets working tree.
///
class SmartBlocProvider<T extends StateStreamableSource<S>, S> extends StatelessWidget {

  final SmartBlocOnCreate<T> onCreate;
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
