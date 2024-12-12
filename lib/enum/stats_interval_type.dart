enum StatsIntervalType {

  days(14),
  weeks(7*2),
  months(30*12),
  years(365*12);

  final int intervalInDays;
  const StatsIntervalType(this.intervalInDays);

}
