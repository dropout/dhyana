import 'package:audio_service/audio_service.dart';
import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/core/presentation/app_bar/custom_app_bar.dart';
import 'package:dhyana/core/presentation/app_bar/custom_back_button.dart';
import 'package:dhyana/core/navigation/app_routes.dart';
import 'package:dhyana/widget/context/chanting_context.dart';
import 'package:dhyana/widget/chanting/chanting_player_view.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChantingScreen extends StatelessWidget {
  final ChantingSettings chantingSettings;

  const ChantingScreen({required this.chantingSettings, super.key});

  @override
  Widget build(BuildContext context) {
    return ChantingContext(
      chantingSettings: chantingSettings,
      onCreate: (chantingCubit, presenceCubit) async {
        await chantingCubit.setup(chantingSettings);
        chantingCubit.play();
      },
      child: buildScaffolding(context),
    );
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
          chantingSettings: state.chantingSettings,
          startTime: state.startTime ?? DateTime.now().subtract(state.elapsedSessionTime),
          endTime: state.endTime ?? DateTime.now(),
          duration: state.elapsedSessionTime,
        );
        SessionCompletedRoute($extra: session).replace(context);
      },
    );
  }
}
