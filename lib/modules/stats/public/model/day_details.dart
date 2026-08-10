import 'package:dhyana/modules/stats/public/model/stats_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_details.freezed.dart';

@freezed
sealed class DayDetails with _$DayDetails {

  const DayDetails._();

  const factory DayDetails({
    required String id,
    required DateTime startDate,    
    @Default([]) List<StatsSession> sessions,
    @Default(0) int consecutiveDaysCount,
  }) = _DayDetails;

}