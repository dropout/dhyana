import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/presence_bloc_provider.dart';
import 'package:dhyana/widget/presence/presence_view.dart';
import 'package:dhyana/widget/util/app_animation.dart';
import 'package:dhyana/widget/util/gap.dart';
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
  
  double intervalInMinutes = 60;

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
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppThemeData.paddingLg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(context, 'Presence'),
                Gap.small(),
                Text('See who you have practiced with.'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppThemeData.paddingLg),
                  child: Slider(
                    divisions: 17,
                    min: 10,
                    max: 180,
                    activeColor: Colors.black,
                    label: '${intervalInMinutes.round()} minutes',
                    value: intervalInMinutes,
                    onChanged: (double sliderValue) {
                      setState(() {
                        intervalInMinutes = sliderValue;
                      });
                    }
                  ),
                )
              ],
            ),
          )
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

