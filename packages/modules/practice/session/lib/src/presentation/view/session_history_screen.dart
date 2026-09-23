import 'package:session/src/presentation/viewmodel/sessions/sessions_cubit.dart';
import 'package:session/l10n/session_localizations.dart';
import 'package:core/core.dart';
import 'package:session/src/public/view/session_history_list.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


class const SessionHistoryScreen({
  required final String profileId,
  super.key,
}) extends StatelessWidget
  with DefaultScreenSetupHelpersMixin {

  @override
  Widget build(BuildContext context) {
    return SmartBlocProvider<SessionsCubit, SessionsState>(
      create: (context) => GetIt.I.get<SessionsCubit>()..loadSessions(profileId),        
      builder: (context, state) => buildSessionsState(context),
    );
  }

  Widget buildSessionsState(BuildContext context) {
    return BlocBuilder<SessionsCubit, SessionsState>(
      builder: (context, state) {
        switch (state) {
          case SessionsLoaded():
            return DefaultScreenSetup(
              title: SessionLocalizations.of(context).sessionsHistory,
              enableAppBarSliver: false,
              slivers: [
                SliverSafeArea(
                  top: false,
                  sliver: SessionHistoryList(sessions: state.sessions),
                )
              ]
            );
          case SessionsLoading():
            return DefaultScreenSetup(
              title: SessionLocalizations.of(context).sessionsHistory,
              enableScrolling: false,
              enableAppBarSliver: false,
              slivers: [
                buildLoadingSliver(context),
              ]
            );
          case SessionsLoadingError():
            return DefaultScreenSetup(
              title: SessionLocalizations.of(context).sessionsHistory,
              enableScrolling: false,
              enableAppBarSliver: false,
              slivers: [
                buildErrorSliver(context),
              ]
            );
          default:
            return DefaultScreenSetup(
              title: SessionLocalizations.of(context).sessionsHistory,
              enableScrolling: false,
              enableAppBarSliver: false,
              slivers: []
            );
        }
      }
    );
  }

}
