import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessions_event.dart';
part 'sessions_state.dart';
part 'sessions_bloc.freezed.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {
  SessionsBloc() : super(const SessionsState.initial()) {
    on<SessionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
