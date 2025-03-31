import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/presence/presence_list.dart';
import 'package:dhyana/widget/util/gap.dart';
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
        Icon(Icons.public_rounded, color: Colors.grey.shade400),
        Gap.xxl(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppThemeData.spacingLg),
          child: PresenceList(
            presenceList: state.presenceList,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }

}
