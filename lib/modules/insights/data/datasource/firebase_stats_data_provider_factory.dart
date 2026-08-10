import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/modules/insights/data/datasource/day_details_data_provider.dart';
import 'package:dhyana/modules/insights/data/datasource/firebase_day_details_data_provider.dart';
import 'package:dhyana/modules/insights/data/datasource/firebase_stats_bucket_data_provider.dart';
import 'package:dhyana/modules/insights/data/datasource/stats_bucket_data_provider.dart';
import 'package:dhyana/modules/insights/domain/enum/stats_entity_granularity.dart';

class FirebaseStatsDataProviderFactory {
  final FirebaseFirestore fireStore;

  FirebaseStatsDataProviderFactory({required this.fireStore});

  StatsBucketDataProvider createStatsBucketDataProvider(
    String profileId,
    StatsEntityGranularity granularity,
  ) => switch (granularity) {
    .day => FirebaseStatsBucketDataProvider(fireStore: fireStore, bucketName: granularity.name, profileId: profileId),
    .week => FirebaseStatsBucketDataProvider(fireStore: fireStore, bucketName: granularity.name, profileId: profileId),
    .month => FirebaseStatsBucketDataProvider(fireStore: fireStore, bucketName: granularity.name, profileId: profileId),
    .year => FirebaseStatsBucketDataProvider(fireStore: fireStore, bucketName: granularity.name, profileId: profileId),
  };

  DayDetailsDataProvider createDayDetailsDataProvider(String profileId) =>
    FirebaseDayDetailsDataProvider(fireStore: fireStore, profileId: profileId);
}





// class FirebaseInsightsDataProviderFactory {

//   final FirebaseFirestore fireStore;

//   FirebaseInsightsDataProviderFactory({required this.fireStore});

//   FirebaseDayDataProvider createDayDataProvider(String profileId) {
//     return FirebaseDayDataProvider(fireStore, profileId);
//   }

//   FirebaseWeekDataProvider createWeekDataProvider(String profileId) {
//     return FirebaseWeekDataProvider(fireStore, profileId);
//   }

//   FirebaseMonthDataProvider createMonthDataProvider(String profileId) {
//     return FirebaseMonthDataProvider(fireStore, profileId);
//   }

//   FirebaseYearDataProvider createYearDataProvider(String profileId) {
//     return FirebaseYearDataProvider(fireStore, profileId);
//   }

//   StatsBucketDataProvider createStatsBucketDataProvider(
//     String profileId,
//     StatsGranularity granularity,
//   ) {
//     switch (granularity) {
//       case StatsGranularity.day:
//         return _DayStatsBucketDataProviderAdapter(
//           createDayDataProvider(profileId),
//         );
//       case StatsGranularity.week:
//         return _WeekStatsBucketDataProviderAdapter(
//           createWeekDataProvider(profileId),
//         );
//       case StatsGranularity.month:
//         return _MonthStatsBucketDataProviderAdapter(
//           createMonthDataProvider(profileId),
//         );
//       case StatsGranularity.year:
//         return _YearStatsBucketDataProviderAdapter(
//           createYearDataProvider(profileId),
//         );
//     }
//   }

//   DayDetailsDataProvider createDayDetailsDataProvider(String profileId) {
//     return _DayDetailsDataProviderAdapter(
//       createDayDataProvider(profileId),
//     );
//   }

// }

// class _DayStatsBucketDataProviderAdapter implements StatsBucketDataProvider {
//   final FirebaseDayDataProvider _dayDataProvider;

//   _DayStatsBucketDataProviderAdapter(this._dayDataProvider);

//   @override
//   Future<void> create(StatsBucketEntity item) => set(item);

//   @override
//   Future<void> delete(String id) => _dayDataProvider.delete(id);

//   @override
//   Future<bool> exists(String id) => _dayDataProvider.exists(id);

//   @override
//   Future<StatsBucketEntity> read(String id, {bool preferCache = false}) async {
//     final day = await _dayDataProvider.read(id, preferCache: preferCache);
//     return _toBucket(day);
//   }

//   @override
//   Stream<StatsBucketEntity> readStream(String id) =>
//       _dayDataProvider.readStream(id).map(_toBucket);

//   @override
//   Future<List<StatsBucketEntity>> query({
//     required DateTime from,
//     required DateTime to,
//   }) async {
//     final days = await _dayDataProvider.query(from: from, to: to);
//     return days.map(_toBucket).toList();
//   }

//   @override
//   Stream<List<StatsBucketEntity>> queryStream({
//     required DateTime from,
//     required DateTime to,
//   }) {
//     return _dayDataProvider
//         .queryStream(from: from, to: to)
//         .map((days) => days.map(_toBucket).toList());
//   }

//   @override
//   Future<void> set(
//     StatsBucketEntity bucket, {
//     bool merge = false,
//     List<Object>? mergeFields,
//   }) {
//     return _dayDataProvider.set(
//       Day(
//         id: bucket.id,
//         startDate: bucket.startDate,
//         minutesCount: bucket.minutesCount,
//         sessionCount: bucket.sessionCount,
//       ),
//       merge: merge,
//       mergeFields: mergeFields ??
//           const [
//             'startDate',
//             'minutesCount',
//             'sessionCount',
//           ],
//     );
//   }

//   @override
//   Future<void> update(StatsBucketEntity item) =>
//       set(item, merge: true);

//   StatsBucketEntity _toBucket(Day day) {
//     return StatsBucketEntity(
//       id: day.id,
//       startDate: day.startDate,
//       minutesCount: day.minutesCount,
//       sessionCount: day.sessionCount,
//     );
//   }
// }

// class _WeekStatsBucketDataProviderAdapter implements StatsBucketDataProvider {
//   final FirebaseWeekDataProvider _weekDataProvider;

//   _WeekStatsBucketDataProviderAdapter(this._weekDataProvider);

//   @override
//   Future<void> create(StatsBucketEntity item) => set(item);

//   @override
//   Future<void> delete(String id) => _weekDataProvider.delete(id);

//   @override
//   Future<bool> exists(String id) => _weekDataProvider.exists(id);

//   @override
//   Future<StatsBucketEntity> read(String id, {bool preferCache = false}) async {
//     final week = await _weekDataProvider.read(id, preferCache: preferCache);
//     return StatsBucketEntity(
//       id: week.id,
//       startDate: week.startDate,
//       minutesCount: week.minutesCount,
//       sessionCount: week.sessionCount,
//     );
//   }

//   @override
//   Stream<StatsBucketEntity> readStream(String id) =>
//       _weekDataProvider.readStream(id).map(
//             (week) => StatsBucketEntity(
//               id: week.id,
//               startDate: week.startDate,
//               minutesCount: week.minutesCount,
//               sessionCount: week.sessionCount,
//             ),
//           );

//   @override
//   Future<List<StatsBucketEntity>> query({
//     required DateTime from,
//     required DateTime to,
//   }) async {
//     final weeks = await _weekDataProvider.query(from: from, to: to);
//     return weeks
//         .map(
//           (week) => StatsBucketEntity(
//             id: week.id,
//             startDate: week.startDate,
//             minutesCount: week.minutesCount,
//             sessionCount: week.sessionCount,
//           ),
//         )
//         .toList();
//   }

//   @override
//   Stream<List<StatsBucketEntity>> queryStream({
//     required DateTime from,
//     required DateTime to,
//   }) {
//     return _weekDataProvider.queryStream(from: from, to: to).map(
//           (weeks) => weeks
//               .map(
//                 (week) => StatsBucketEntity(
//                   id: week.id,
//                   startDate: week.startDate,
//                   minutesCount: week.minutesCount,
//                   sessionCount: week.sessionCount,
//                 ),
//               )
//               .toList(),
//         );
//   }

//   @override
//   Future<void> set(
//     StatsBucketEntity bucket, {
//     bool merge = false,
//     List<Object>? mergeFields,
//   }) {
//     return _weekDataProvider.set(
//       Week(
//         id: bucket.id,
//         startDate: bucket.startDate,
//         minutesCount: bucket.minutesCount,
//         sessionCount: bucket.sessionCount,
//       ),
//       merge: merge,
//       mergeFields: mergeFields,
//     );
//   }

//   @override
//   Future<void> update(StatsBucketEntity item) =>
//       set(item, merge: true);
// }

// class _MonthStatsBucketDataProviderAdapter implements StatsBucketDataProvider {
//   final FirebaseMonthDataProvider _monthDataProvider;

//   _MonthStatsBucketDataProviderAdapter(this._monthDataProvider);

//   @override
//   Future<void> create(StatsBucketEntity item) => set(item);

//   @override
//   Future<void> delete(String id) => _monthDataProvider.delete(id);

//   @override
//   Future<bool> exists(String id) => _monthDataProvider.exists(id);

//   @override
//   Future<StatsBucketEntity> read(String id, {bool preferCache = false}) async {
//     final month = await _monthDataProvider.read(id, preferCache: preferCache);
//     return StatsBucketEntity(
//       id: month.id,
//       startDate: month.startDate,
//       minutesCount: month.minutesCount,
//       sessionCount: month.sessionCount,
//     );
//   }

//   @override
//   Stream<StatsBucketEntity> readStream(String id) =>
//       _monthDataProvider.readStream(id).map(
//             (month) => StatsBucketEntity(
//               id: month.id,
//               startDate: month.startDate,
//               minutesCount: month.minutesCount,
//               sessionCount: month.sessionCount,
//             ),
//           );

//   @override
//   Future<List<StatsBucketEntity>> query({
//     required DateTime from,
//     required DateTime to,
//   }) async {
//     final months = await _monthDataProvider.query(from: from, to: to);
//     return months
//         .map(
//           (month) => StatsBucketEntity(
//             id: month.id,
//             startDate: month.startDate,
//             minutesCount: month.minutesCount,
//             sessionCount: month.sessionCount,
//           ),
//         )
//         .toList();
//   }

//   @override
//   Stream<List<StatsBucketEntity>> queryStream({
//     required DateTime from,
//     required DateTime to,
//   }) {
//     return _monthDataProvider.queryStream(from: from, to: to).map(
//           (months) => months
//               .map(
//                 (month) => StatsBucketEntity(
//                   id: month.id,
//                   startDate: month.startDate,
//                   minutesCount: month.minutesCount,
//                   sessionCount: month.sessionCount,
//                 ),
//               )
//               .toList(),
//         );
//   }

//   @override
//   Future<void> set(
//     StatsBucketEntity bucket, {
//     bool merge = false,
//     List<Object>? mergeFields,
//   }) {
//     return _monthDataProvider.set(
//       Month(
//         id: bucket.id,
//         startDate: bucket.startDate,
//         minutesCount: bucket.minutesCount,
//         sessionCount: bucket.sessionCount,
//       ),
//       merge: merge,
//       mergeFields: mergeFields,
//     );
//   }

//   @override
//   Future<void> update(StatsBucketEntity item) =>
//       set(item, merge: true);
// }

// class _YearStatsBucketDataProviderAdapter implements StatsBucketDataProvider {
//   final FirebaseYearDataProvider _yearDataProvider;

//   _YearStatsBucketDataProviderAdapter(this._yearDataProvider);

//   @override
//   Future<void> create(StatsBucketEntity item) => set(item);

//   @override
//   Future<void> delete(String id) => _yearDataProvider.delete(id);

//   @override
//   Future<bool> exists(String id) => _yearDataProvider.exists(id);

//   @override
//   Future<StatsBucketEntity> read(String id, {bool preferCache = false}) async {
//     final year = await _yearDataProvider.read(id, preferCache: preferCache);
//     return StatsBucketEntity(
//       id: year.id,
//       startDate: year.startDate,
//       minutesCount: year.minutesCount,
//       sessionCount: year.sessionCount,
//     );
//   }

//   @override
//   Stream<StatsBucketEntity> readStream(String id) =>
//       _yearDataProvider.readStream(id).map(
//             (year) => StatsBucketEntity(
//               id: year.id,
//               startDate: year.startDate,
//               minutesCount: year.minutesCount,
//               sessionCount: year.sessionCount,
//             ),
//           );

//   @override
//   Future<List<StatsBucketEntity>> query({
//     required DateTime from,
//     required DateTime to,
//   }) async {
//     final years = await _yearDataProvider.query(from: from, to: to);
//     return years
//         .map(
//           (year) => StatsBucketEntity(
//             id: year.id,
//             startDate: year.startDate,
//             minutesCount: year.minutesCount,
//             sessionCount: year.sessionCount,
//           ),
//         )
//         .toList();
//   }

//   @override
//   Stream<List<StatsBucketEntity>> queryStream({
//     required DateTime from,
//     required DateTime to,
//   }) {
//     return _yearDataProvider.queryStream(from: from, to: to).map(
//           (years) => years
//               .map(
//                 (year) => StatsBucketEntity(
//                   id: year.id,
//                   startDate: year.startDate,
//                   minutesCount: year.minutesCount,
//                   sessionCount: year.sessionCount,
//                 ),
//               )
//               .toList(),
//         );
//   }

//   @override
//   Future<void> set(
//     StatsBucketEntity bucket, {
//     bool merge = false,
//     List<Object>? mergeFields,
//   }) {
//     return _yearDataProvider.set(
//       Year(
//         id: bucket.id,
//         startDate: bucket.startDate,
//         minutesCount: bucket.minutesCount,
//         sessionCount: bucket.sessionCount,
//       ),
//       merge: merge,
//       mergeFields: mergeFields,
//     );
//   }

//   @override
//   Future<void> update(StatsBucketEntity item) =>
//       set(item, merge: true);
// }

// class _DayDetailsDataProviderAdapter implements DayDetailsDataProvider {
//   final FirebaseDayDataProvider _dayDataProvider;

//   _DayDetailsDataProviderAdapter(this._dayDataProvider);

//   @override
//   Future<void> create(DayDetailsEntity item) => set(item, merge: true);

//   @override
//   Future<void> delete(String id) => _dayDataProvider.delete(id);

//   @override
//   Future<bool> exists(String id) => _dayDataProvider.exists(id);

//   @override
//   Future<DayDetailsEntity> read(String id, {bool preferCache = false}) async {
//     final day = await _dayDataProvider.read(id, preferCache: preferCache);
//     return DayDetailsEntity(
//       id: day.id,
//       sessions: day.sessions,
//       consecutiveDaysCount: day.consecutiveDaysCount,
//     );
//   }

//   @override
//   Stream<DayDetailsEntity> readStream(String id) {
//     return _dayDataProvider.readStream(id).map(
//           (day) => DayDetailsEntity(
//             id: day.id,
//             sessions: day.sessions,
//             consecutiveDaysCount: day.consecutiveDaysCount,
//           ),
//         );
//   }

//   @override
//   Future<void> set(
//     DayDetailsEntity details, {
//     bool merge = false,
//     List<Object>? mergeFields,
//   }) async {
//     final existing = await _dayDataProvider.read(details.id).catchError((_) {
//       return Day(
//         id: details.id,
//         startDate: _parseDayId(details.id),
//       );
//     });
//     final updated = existing.copyWith(
//       sessions: details.sessions,
//       consecutiveDaysCount: details.consecutiveDaysCount,
//     );

//     await _dayDataProvider.set(
//       updated,
//       merge: merge,
//       mergeFields: mergeFields ?? const ['sessions', 'consecutiveDaysCount'],
//     );
//   }

//   @override
//   Future<void> update(DayDetailsEntity item) => set(item, merge: true);

//   DateTime _parseDayId(String dayId) {
//     if (dayId.length != 8) {
//       throw ArgumentError('Invalid day id: $dayId');
//     }

//     final year = int.parse(dayId.substring(0, 4));
//     final month = int.parse(dayId.substring(4, 6));
//     final day = int.parse(dayId.substring(6, 8));
//     return DateTime(year, month, day);
//   }

// }
