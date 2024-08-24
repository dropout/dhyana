import 'package:dhyana/widget/bloc_provider/presence_bloc_provider.dart';
import 'package:dhyana/widget/presence/presence_view.dart';
import 'package:dhyana/widget/util/app_back_button.dart';
import 'package:flutter/material.dart';

class PresenceScreen extends StatelessWidget {
  const PresenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: PresenceBlocProvider(
        child: buildBody(context),
      )
    );
  }

  Widget buildBody(BuildContext context) {
    return const Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Text('Presence screen'),
            PresenceView(),
          ],
        ),
        AppBackButton(),
      ],
    );
  }

}
