import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/presence_bloc_provider.dart';
import 'package:dhyana/widget/presence/presence_view.dart';
import 'package:dhyana/widget/util/app_animation.dart';
import 'package:dhyana/widget/util/title_effect.dart';
import 'package:flutter/material.dart';

class PresenceScreen extends StatelessWidget {
  const PresenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      extendBodyBehindAppBar: true,
      body: PresenceBlocProvider(
        initialEvent: PresenceEvent.load(),
        child: PresenceScreenView(),
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
            PresenceScreenView(),
          ],
        ),

      ],
    );
  }

}

class PresenceScreenView extends StatefulWidget {
  const PresenceScreenView({super.key});

  @override
  State<PresenceScreenView> createState() => _PresenceScreenViewState();
}

class _PresenceScreenViewState extends State<PresenceScreenView>
  with SingleTickerProviderStateMixin, TitleEffectMixin {

  @override
  void initState() {
    titleEffectScrollController.addListener(
      createListener(titleEffectScrollController, setState)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: titleEffectScrollController,
      slivers: [
        buildAppBar(context, titleText: 'Presence'),
        buildSliverTitle(context, 'Presence'),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: AppThemeData.spacingMd,
              right: AppThemeData.spacingMd,
              bottom: AppThemeData.spacingXl,
            ),
            child: Text('See who you have practiced with.'),
          ),
        ),
        SliverSafeArea(
          top: false,
          sliver: SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppThemeData.spacingMd),
              child: PresenceView(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    titleEffectScrollController.dispose();
    super.dispose();
  }

}

