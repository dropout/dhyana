import 'package:dhyana/model/profile.dart';
import 'package:flutter/material.dart';

class MonthTab extends StatefulWidget {

  final Profile profile;

  const MonthTab({
    required this.profile,
    super.key,
  });

  @override
  State<MonthTab> createState() => _MonthTabState();
}

class _MonthTabState extends State<MonthTab> {
  @override

  Widget build(BuildContext context) {
    return const Placeholder();
  }

}
