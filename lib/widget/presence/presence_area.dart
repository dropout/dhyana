import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/presence/presence_view.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresenceArea extends StatelessWidget {

  final Profile profile;
  final int batchSize;
  final int maxPageCount;
  final bool isLoadMoreEnabled;
  final int intervalInMinutes;

  const PresenceArea({
    required this.profile,
    this.batchSize = 18,
    this.maxPageCount = 3,
    this.isLoadMoreEnabled = true,
    this.intervalInMinutes = 120,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PresenceBloc>(
      create: (context) => PresenceBloc(
        presenceRepository: context.repos.presenceRepository,
        crashlyticsService: context.services.crashlyticsService,
        profileRepository: context.repos.profileRepository,
      )..add(PresenceEvent.load(
        ownProfileId: profile.id,
        batchSize: batchSize,
        intervalInMinutes: intervalInMinutes,
        )
      ),
      child: PresenceView(
        batchSize: batchSize,
        maxPageCount: maxPageCount,
      ),
    );
  }

}
