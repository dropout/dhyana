import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class ProfileMetricsView extends StatelessWidget {

  final Profile? profile;

  const ProfileMetricsView({
    this.profile,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    int sessionCount = (profile != null) ?  profile!.statsReport.completedSessionsCount : 0;
    int minutesCount = (profile != null) ?  profile!.statsReport.completedMinutesCount : 0;
    int daysCount = (profile != null) ?  profile!.statsReport.completedDaysCount : 0;

    return Row(
      children: [
        Expanded(
            child: ProfileMetricBox(
              sessionCount,
              'Sessions',
            )
        ),
        const SizedBox(width: AppThemeData.spacingMd),
        Expanded(
            child: ProfileMetricBox(
              minutesCount,
              'Perc',
            )
        ),
        const SizedBox(width: AppThemeData.spacingMd),
        Expanded(
            child: ProfileMetricBox(
              daysCount,
              'Nap',
            )
        )
      ],
    );
  }

}

class ProfileMetricsDisplayLoading extends StatelessWidget {

  const ProfileMetricsDisplayLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: ProfileMetricBoxLoading()
        ),
        SizedBox(width: 8),
        Expanded(
            child: ProfileMetricBoxLoading()
        ),
        SizedBox(width: 8),
        Expanded(
            child: ProfileMetricBoxLoading()
        )
      ],
    );
  }
}


class ProfileMetricBox extends StatelessWidget {

  final String label;
  final int value;

  const ProfileMetricBox(
      this.value,
      this.label,
      {super.key}
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.paddingMd),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(value.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )
          ),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            )
          )
        ],),
    );
  }

}

class ProfileMetricBoxLoading extends StatelessWidget {

  const ProfileMetricBoxLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 20,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.white,
      ),
    );
  }
}
