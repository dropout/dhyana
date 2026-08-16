import 'package:dhyana/core/presentation/view/util/smart_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:dhyana/modules/social/social_module.dart';
import 'package:dhyana/modules/social/public/view/presence_view.dart';

class PresenceArea extends StatelessWidget {
  static Widget withCubit({
    required String profileId,
    int batchSize = 18,
    int maxPageCount = 3,
    bool isLoadMoreEnabled = true,
    int intervalInMinutes = 120,
    void Function(PresenceCubit cubit)? onCubitCreated,
  }) {
    return SmartBlocProvider<PresenceCubit, PresenceState>(
      key: const ValueKey('presence_cubit'),
      create: (context) {
        final cubit = GetIt.instance.get<PresenceCubit>();
        if (onCubitCreated != null) {
          onCubitCreated(cubit);
        }
        return cubit;
      },
      builder: (context, state) {
        return PresenceArea(
          profileId: profileId,
          batchSize: batchSize,
          maxPageCount: maxPageCount,
          isLoadMoreEnabled: isLoadMoreEnabled,
          intervalInMinutes: intervalInMinutes,
        );
      },
    );
  }

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
    return PresenceView(
      batchSize: batchSize,
      maxPageCount: maxPageCount,
      borderColor: Colors.grey.shade500,
      textColor: Colors.grey.shade500,
    );

    // return BlocProvider<PresenceCubit>(
    //   create: (context) =>
    //       GetIt.instance.get<PresenceCubit>()..loadPresenceData(
    //         ownProfileId: profileId,
    //         limit: batchSize,
    //         windowSize: Duration(minutes: intervalInMinutes),
    //       ),
    //   child: PresenceView(
    //     batchSize: batchSize,
    //     maxPageCount: maxPageCount,
    //     borderColor: Colors.grey.shade500,
    //     textColor: Colors.grey.shade500,
    //   ),
    // );
  }
}
