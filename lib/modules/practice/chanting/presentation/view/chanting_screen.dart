import 'package:dhyana/core/presentation/view/smart_bloc_provider.dart';
import 'package:dhyana/modules/practice/chanting/chanting_module.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chanting_state_entity.dart';
import 'package:dhyana/modules/practice/chanting/presentation/viewmodel/chanting_cubit.dart';
import 'package:dhyana/core/presentation/view/app_bar/custom_app_bar.dart';
import 'package:dhyana/core/presentation/view/app_bar/custom_back_button.dart';
import 'package:dhyana/modules/practice/chanting/presentation/view/player/chanting_player_view.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ChantingScreen extends StatelessWidget {
  final ChantingSettings chantingSettings;

  const ChantingScreen({required this.chantingSettings, super.key});

  @override
  Widget build(BuildContext context) {
    return SmartBlocProvider<ChantingCubit, ChantingStateEntity>(
      create: (BuildContext context) {
        return GetIt.I.get<ChantingCubit>(param1: chantingSettings)..start();
      },
      builder: (context, state) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(leading: CustomBackButton()),
        backgroundColor: Colors.black,
        body: ChantingPlayerView(
          chantingState: state,
          wakelockService: context.services.wakelockService,
        ),
      ),
    );
  }

}
