import 'package:dhyana/modules/profile/data/mapper/profile_session_mapper.dart';
import 'package:dhyana/modules/profile/domain/entity/milestone_progress_entity.dart';
import 'package:dhyana/modules/profile/public/model/milestone_progress.dart';

extension MilestoneProgressEntityMapper on MilestoneProgressEntity {
	MilestoneProgress toApi() {
		return MilestoneProgress(
			completedDaysCount: completedDaysCount,
			targetDaysCount: targetDaysCount,
			sessions: sessions.map((e) => e.toApi()).toList(),
		);
	}
}

extension MilestoneProgressMapper on MilestoneProgress {
  MilestoneProgressEntity toDomain() {
    return MilestoneProgressEntity(
      completedDaysCount: completedDaysCount,
      targetDaysCount: targetDaysCount,
      sessions: sessions.map((e) => e.toDomain()).toList(),
    );
  }
}

