import 'package:dhyana/bloc/sessions/sessions_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/screen/all.dart';

import 'package:dhyana/widget/bloc_provider/sessions_bloc_provider.dart';
import 'package:dhyana/widget/session/history/session_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionHistoryScreen extends StatelessWidget
  with DefaultScreenSetupHelpersMixin {

  final String profileId;

  const SessionHistoryScreen({
    required this.profileId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SessionsCubitProvider(
      onCreate: (sessionsBloc) => sessionsBloc.loadSessions(profileId),
      child: buildSessionsState(context),
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
