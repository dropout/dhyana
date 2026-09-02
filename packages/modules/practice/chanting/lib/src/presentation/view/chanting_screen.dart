import 'package:chanting/src/chanting_module.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/presentation/viewmodel/chanting_cubit.dart';
import 'package:chanting/src/presentation/view/player/chanting_player_view.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
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
