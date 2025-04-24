import 'package:dhyana/model/profile.dart';
import 'package:flutter/material.dart';

class MonthsStatsView extends StatefulWidget {

  final Profile profile;

  const MonthsStatsView({
    required this.profile,
    super.key,
  });

  @override
  State<MonthsStatsView> createState() => _MonthsStatsViewState();
}

class _MonthsStatsViewState extends State<MonthsStatsView> {
  @override

  Widget build(BuildContext context) {
    return const Placeholder();
  }

}
