import 'package:dhyana/modules/stats/domain/entity/stats_bucket_entity.dart';
import 'package:dhyana/modules/stats/public/model/stats_bucket.dart';

extension StatsBucketMapper on StatsBucketEntity {

  StatsBucket toApi() => map(
    day: (day) => StatsBucket.day(
      id: day.id,
      startDate: day.startDate,
      minutesCount: day.minutesCount,
      sessionCount: day.sessionCount,
    ),
    week: (week) => StatsBucket.week(
      id: week.id,
      startDate: week.startDate,
      minutesCount: week.minutesCount,
      sessionCount: week.sessionCount,
    ),
    month: (month) => StatsBucket.month(
      id: month.id,
      startDate: month.startDate,
      minutesCount: month.minutesCount,
      sessionCount: month.sessionCount,
    ),
    year: (year) => StatsBucket.year(
      id: year.id,
      startDate: year.startDate,
      minutesCount: year.minutesCount,
      sessionCount: year.sessionCount,
    ),
  );

}

extension StatsBucketEntityMapper on StatsBucket {

  StatsBucketEntity toEntity() => map(
    day: (day) => StatsBucketEntity.day(
      id: day.id,
      startDate: day.startDate,
      minutesCount: day.minutesCount,
      sessionCount: day.sessionCount,
    ),
    week: (week) => StatsBucketEntity.week(
      id: week.id,
      startDate: week.startDate,
      minutesCount: week.minutesCount,
      sessionCount: week.sessionCount,
    ),
    month: (month) => StatsBucketEntity.month(
      id: month.id,
      startDate: month.startDate,
      minutesCount: month.minutesCount,
      sessionCount: month.sessionCount,
    ),
    year: (year) => StatsBucketEntity.year(
      id: year.id,
      startDate: year.startDate,
      minutesCount: year.minutesCount,
      sessionCount: year.sessionCount,
    ),
  );

}