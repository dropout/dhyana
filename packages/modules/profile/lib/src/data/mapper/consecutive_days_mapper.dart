import 'package:profile/src/domain/entity/consecutive_days_entity.dart';
import 'package:profile/src/public/model/consecutive_days.dart';

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