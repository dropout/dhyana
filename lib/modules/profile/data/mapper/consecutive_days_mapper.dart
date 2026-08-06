import 'package:dhyana/modules/profile/domain/entity/consecutive_days_entity.dart';
import 'package:dhyana/modules/profile/public/model/consecutive_days.dart';

extension ConsecutiveDaysApiMapper on ConsecutiveDays {
	ConsecutiveDaysEntity toDomain() {
		return ConsecutiveDaysEntity(
			current: current,
			longest: longest,
			startedAt: startedAt,
			lastChecked: lastChecked,
		);
	}
}

extension ConsecutiveDaysEntityMapper on ConsecutiveDaysEntity {
	ConsecutiveDays toApi() {
		return ConsecutiveDays(
			current: current,
			longest: longest,
			startedAt: startedAt,
			lastChecked: lastChecked,
		);
	}
}