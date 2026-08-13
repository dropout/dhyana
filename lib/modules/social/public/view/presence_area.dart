import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:dhyana/modules/social/social_module.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options_entity.dart';
import 'package:dhyana/modules/social/public/view/presence_view.dart';


class PresenceArea extends StatelessWidget {

  final String profileId;
  final int batchSize;
  final int maxPageCount;
  final bool isLoadMoreEnabled;
  final int intervalInMinutes;

  const PresenceArea({
    required this.profileId,
    this.batchSize = 18,
    this.maxPageCount = 3,
    this.isLoadMoreEnabled = true,
    this.intervalInMinutes = 120,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PresenceCubit>(
      create: (context) =>
          GetIt.instance.get<PresenceCubit>()..loadPresenceData(
            queryOptions: PresenceQueryOptionsEntity(
              ownProfileId: profileId,
              limit: batchSize,
              windowSize: Duration(minutes: intervalInMinutes),
            ),
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
