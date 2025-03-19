import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/presence/presence_list.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/util/separator_gem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresenceArea extends StatefulWidget {

  final Profile profile;
  final void Function()? onInit;

  const PresenceArea({
    required this.profile,
    this.onInit,
    super.key
  });

  @override
  State<PresenceArea> createState() => _PresenceAreaState();
}

class _PresenceAreaState extends State<PresenceArea> {

  @override
  void initState() {
    widget.onInit?.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PresenceBloc, PresenceState>(
      builder: (BuildContext context, PresenceState state) {
        switch (state) {
          case PresenceLoadedState():
            return buildView(context, state);
          default:
            return SizedBox.shrink();
        }
      },
    );
  }

  Widget buildView(BuildContext context, PresenceLoadedState state) {
    if (state.presenceList.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const SeparatorGem(count: 0, padding: EdgeInsets.all(AppThemeData.spacingMd),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppThemeData.spacingLg),
          child: Column(
            children: [
              Text('Here, now',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: AppThemeData.spacingLg),
              PresenceList(
                presenceList: state.presenceList,
                textColor: Colors.white,
              ),
              const SizedBox(height: AppThemeData.spacingLg),
            ],
          )
        ),
      ],
    );
  }

}
