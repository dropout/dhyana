import 'package:dhyana/core/presentation/view/default_screen_setup.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/sessions/sessions_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/core/presentation/view/util/smart_bloc_provider.dart';
import 'package:dhyana/modules/practice/session/presentation/view/history/session_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


class SessionHistoryScreen extends StatelessWidget
  with DefaultScreenSetupHelpersMixin {

  final String profileId;

  const SessionHistoryScreen({
    required this.profileId,
    super.key
  });

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
              title: AppLocalizations.of(context).sessionsHistory,
              slivers: [
                SliverSafeArea(
                  top: false,
                  sliver: SessionHistoryList(sessions: state.sessions),
                )
              ]
            );
          case SessionsLoading():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).sessionsHistory,
              enableScrolling: false,
              slivers: [
                buildLoadingSliver(context),
              ]
            );
          case SessionsLoadingError():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).sessionsHistory,
              enableScrolling: false,
              slivers: [
                buildErrorSliver(context),
              ]
            );
          default:
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).sessionsHistory,
              enableScrolling: false,
              slivers: []
            );
        }
      }
    );
  }

}
