import 'package:core/core.dart';
import 'package:stats/src/domain/entity/day_details_entity.dart';

abstract interface class DayDetailsDataProvider
  implements DataProvider<DayDetailsEntity> {
  Future<void> set(
    DayDetailsEntity details, {
    bool merge,
    List<Object>? mergeFields,
  });

  Future<List<DayDetailsEntity>> query({
    required DateTime from,
    required DateTime to,
  });

  Stream<List<DayDetailsEntity>> queryStream({
    required DateTime from,
    required DateTime to,
  });
  
}
