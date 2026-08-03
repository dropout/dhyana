import 'package:audio_service/audio_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chanting_state.dart';
import 'package:dhyana/modules/practice/chanting/presentation/viewmodel/chanting/chanting_cubit.dart';
import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/core/domain/entity/chant/chanting_settings.dart';
import 'package:dhyana/core/presentation/view/app_bar/custom_app_bar.dart';
import 'package:dhyana/core/presentation/view/app_bar/custom_back_button.dart';
import 'package:dhyana/modules/practice/chanting/presentation/view/chanting_player_view.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/modules/practice/session/session_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ChantingScreen extends StatelessWidget {
  final ChantingSettings chantingSettings;

  const ChantingScreen({required this.chantingSettings, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChantingCubit>(
      create: (BuildContext context) {
        return GetIt.I.get<ChantingCubit>(param1: chantingSettings)..start();
      },
    );

    // return ChantingContext(
    //   chantingSettings: chantingSettings,
    //   onCreate: (chantingCubit) async {
    //     await chantingCubit.setup(chantingSettings);
    //     chantingCubit.play();
    //   },
    //   child: buildScaffolding(context),
    // );
  }

  Widget buildScaffolding(BuildContext context) {
    return BlocConsumer<ChantingCubit, ChantingState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(leading: CustomBackButton()),
          backgroundColor: Colors.black,
          body: ChantingPlayerView(
            chantingState: state,
            wakelockService: context.services.wakelockService,
          ),
        );
      },
      listenWhen: (prevState, currentState) {
        return (prevState.playbackState.processingState !=
                AudioProcessingState.completed &&
            currentState.playbackState.processingState ==
                AudioProcessingState.completed);
      },
      listener: (context, state) {
        Session session = Session(
          id: context.services.idGeneratorService.sessionId(),
          type: SessionType.chanting,
          startTime:
              state.startTime ??
              DateTime.now().subtract(state.elapsedSessionTime),
          endTime: state.endTime ?? DateTime.now(),
          duration: state.elapsedSessionTime,
        );
        SessionCompletedRoute($extra: session).replace(context);
      },
    );
  }
}
