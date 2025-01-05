import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/presence_bloc_provider.dart';
import 'package:dhyana/widget/presence/presence_view.dart';
import 'package:dhyana/widget/util/app_animation.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:dhyana/widget/util/title_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PresenceScreen extends StatefulWidget {
  const PresenceScreen({super.key});

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen>
  with TitleEffectMixin {

  double intervalInMinutes = 60;

  void _onIntervalChange(BuildContext context, double value) {
    setState(() {
      intervalInMinutes = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PresenceBlocProvider(
      initialEvent: PresenceEvent.load(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        extendBodyBehindAppBar: true,
        body: buildStates(context),
      ),
    );
  }

  Widget buildStates(BuildContext context) {
    return BlocBuilder<PresenceBloc, PresenceState>(
      builder: (BuildContext context, PresenceState state) {
        List<Widget> slivers = [];
        switch (state) {
          case PresenceLoadingState():
            slivers = [
              buildTopSliver(context, isLoading: true),
              SliverFillRemaining(
                child: AppLoadingDisplay(),
              )
            ];
          case PresenceLoadedState():
            slivers = [
              buildTopSliver(context),
              buildLoadedSliver(context),
            ];
          case PresenceErrorState():
            slivers = [
              buildTopSliver(context),
              SliverFillRemaining(
                child: AppErrorDisplay(),
              )
            ];
          default:
            slivers = [];
        }

        return buildTitleEffectScrollView(
          context,
          AppLocalizations.of(context).presence,
          slivers: slivers,
        );
      },
    );
  }

  Widget buildScaffolding(BuildContext context) {
    return buildTitleEffectScrollView(
      context,
      AppLocalizations.of(context).presence,
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context).presenceScreenSubTitle),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppThemeData.paddingLg),
                    child: Slider(
                      divisions: 17,
                      min: 10,
                      max: 180,
                      activeColor: Colors.black,
                      label: AppLocalizations.of(context).minutesPlural(intervalInMinutes.round()),
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
        buildLoadedSliver(context),
      ]
    );
  }

  Widget buildTopSliver(BuildContext context, {bool isLoading = false}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                onChanged: isLoading ? null : (double sliderValue) {
                  setState(() {
                    intervalInMinutes = sliderValue;
                  });
                },
                // onChanged: (double sliderValue) {
                //   setState(() {
                //     intervalInMinutes = sliderValue;
                //   });
                // }
              ),
            )
          ],
        ),
      )
    );
  }

  Widget buildLoadedSliver(BuildContext context) {
    return SliverSafeArea(
      top: false,
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppThemeData.spacingMd),
          child: PresenceView(),
        ),
      ),
    );
  }

}
