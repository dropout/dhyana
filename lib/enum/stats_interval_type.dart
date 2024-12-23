enum StatsIntervalType {

  days(14), // 2 weeks, 14 bars
  weeks(7 * 4 * 3), // 3 months, 12 bars
  months(30*12), // 1 year, 12 bars
  years(365*12); // 12 years, 12 bars

  final int intervalInDays;
  const StatsIntervalType(this.intervalInDays);

}
