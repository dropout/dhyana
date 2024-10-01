import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaysBlocProvider extends StatelessWidget {

  final Widget child;
  final DaysEvent? initialEvent;

  const DaysBlocProvider({
    required this.child,
    this.initialEvent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Services services = context.services;
    Repositories repos = context.repos;
    return BlocProvider<DaysBloc>(
      create: (BuildContext context) {
        DaysBloc daysBloc = DaysBloc(
          statisticsRepository: repos.statisticsRepository,
          crashlyticsService: services.crashlyticsService,
        );
        if (initialEvent != null) {
          daysBloc.add(initialEvent!);
        }
        return daysBloc;
      },
      child: child,
    );
  }

}
