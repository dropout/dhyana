import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DebugPrintBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('onCreate -- cubit: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('onChange -- cubit: ${bloc.runtimeType}, change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- cubit: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('onClose -- cubit: ${bloc.runtimeType}');
    super.onClose(bloc);
  }

}