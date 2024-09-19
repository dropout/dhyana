import 'package:dhyana/bloc/sessions/sessions_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/activity/activity_list.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/bloc_provider/sessions_bloc_provider.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        leading: const CustomBackButton(),
        titleText: AppLocalizations.of(context).activity
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SignedIn(
          yes: (context, user) {
            return SessionsBlocProvider(
              initialEvent: SessionsEvent.loadSessions(profileId: user.uid),
              child: buildState(context),
            );
          }
        ),
      )
    );
  }

  Widget buildState(BuildContext context) {
    return BlocBuilder<SessionsBloc, SessionsState>(
      builder: (context, state) {
        switch (state) {
          case SessionsLoaded():
            return ActivityList(sessions: state.sessions);
          case SessionsLoading():
            return const AppLoadingDisplay();
          case SessionsLoadingError():
            return const AppErrorDisplay();
          default:
            return const AppErrorDisplay();
        }
      }
    );
  }

}
