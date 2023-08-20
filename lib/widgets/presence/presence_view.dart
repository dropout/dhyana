import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/widgets/presence/all.dart';
import 'package:dhyana/widgets/util/app_error_display.dart';
import 'package:dhyana/widgets/util/app_loading_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresenceView extends StatelessWidget {
  const PresenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PresenceBloc, PresenceState>(
      builder: (BuildContext context, PresenceState state) {
        switch (state) {
          case PresenceLoadingState():
            return const Text('loading');
          case PresenceLoadedState():
            return buildLoaded(context, state.presenceList);
          case PresenceErrorState():
            return const Text('error');
          default:
            return buildLoaded(context, []);
        }
      },
    );
  }


  Widget buildLoaded(BuildContext context, List<Presence> presenceList) {
    return Wrap(
      children: [
        ...presenceList.map((p) => PresenceListItem(presence: p)).toList()
      ],
    );
  }

}
