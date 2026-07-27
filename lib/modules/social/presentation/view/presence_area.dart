import 'package:dhyana/modules/social/presentation/viewmodel/presence/presence_cubit.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/modules/social/presentation/view/presence_view.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
  Widget build(BuildContext context) {    return BlocProvider<PresenceCubit>(
      create: (context) => GetIt.instance.get<PresenceCubit>()..loadPresenceData(
        ownProfileId: profile.id,
        limit: batchSize,
        interval: Duration(minutes: intervalInMinutes),
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
