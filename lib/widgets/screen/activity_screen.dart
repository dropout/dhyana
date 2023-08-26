import 'package:dhyana/bloc/sessions/sessions_bloc.dart';
import 'package:dhyana/widgets/activity/activity_list.dart';
import 'package:dhyana/widgets/bloc_provider/sessions_bloc_provider.dart';
import 'package:dhyana/widgets/util/app_error_display.dart';
import 'package:dhyana/widgets/util/app_loading_display.dart';
import 'package:dhyana/widgets/util/custom_app_bar.dart';
import 'package:dhyana/widgets/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SignedIn(
          yes: (context, user) {
            return SessionsBlocProvider(
              initialEvent: SessionsEvent.loadSessions(profileId: user.uid),
              child: buildView(context),
            );
          }
        ),
      )
    );
  }
  
  Widget buildView(BuildContext context) {
    return BlocBuilder<SessionsBloc, SessionsState>(
      builder: (context, state) {
        switch (state) {
          case SessionsLoaded():
            return buildLoaded(context, state);
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

  Widget buildLoaded(BuildContext context, SessionsLoaded state) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: CustomAppBar.height),
          child: ActivityList(sessions: state.sessions),
        ),
        const CustomAppBar(
          title: 'Aktivitás',
        ),
      ],
    );
  }

}
