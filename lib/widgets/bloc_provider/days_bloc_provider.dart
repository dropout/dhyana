import 'package:dhyana/bloc/days/days_bloc.dart';
import 'package:dhyana/repository/day_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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

    DayRepository dayRepository =
      Provider.of<DayRepository>(context);

    CrashlyticsService crashlyticsService =
      Provider.of<CrashlyticsService>(context);

    return BlocProvider<DaysBloc>(
      create: (BuildContext context) {
        DaysBloc daysBloc = DaysBloc(
          dayRepository: dayRepository,
          crashlyticsService: crashlyticsService,
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
