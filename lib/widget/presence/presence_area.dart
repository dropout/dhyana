import 'package:dhyana/bloc/presence/presence_cubit.dart';
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
    return BlocProvider<PresenceCubit>(
      create: (context) => PresenceCubit(
        presenceRepository: context.repos.presenceRepository,
        crashlyticsService: context.services.crashlyticsService,
        profileRepository: context.repos.profileRepository,
      )..loadPresenceData(
        ownProfileId: profile.id,
        batchSize: batchSize,
        intervalInMinutes: intervalInMinutes,
      ),
      child: PresenceView(
        batchSize: batchSize,
        maxPageCount: maxPageCount,
        borderColor: Colors.grey.shade500,
        textColor: Colors.grey.shade500,
      ),
    );
  }

}
