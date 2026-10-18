// ignore_for_file: implementation_imports

import 'package:audio_service/audio_service.dart';
import 'package:chanting/chanting.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/presentation/view/player/player_controls.dart';
import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PlayerControls, path: '[Chanting]/internal/view/player/')
Widget buildPlayerControls(BuildContext context) {
  final isPlaying = context.knobs.boolean(label: 'Playing', initialValue: true);
  final isLoading = context.knobs.boolean(label: 'Loading', initialValue: false);
  final durationSeconds = context.knobs.int.slider(label: 'Duration (seconds)', initialValue: 225, min: 1, max: 900);
  final positionSeconds = context.knobs.int.slider(
    label: 'Position (seconds)',
    initialValue: durationSeconds ~/ 3,
    min: 0,
    max: durationSeconds,
  );
  final showProgressBar = context.knobs.boolean(label: 'Show progress bar', initialValue: true);
  final showTime = context.knobs.boolean(label: 'Show time', initialValue: true);
  final isPreviousEnabled = context.knobs.boolean(label: 'Previous enabled', initialValue: true);
  final isNextEnabled = context.knobs.boolean(label: 'Next enabled', initialValue: true);

  final state = ChantingStateEntity(
    chantingSettings: const ChantingSettings(),
    playbackState: PlaybackState(
      playing: isPlaying,
      processingState: isLoading ? AudioProcessingState.loading : AudioProcessingState.ready,
      updatePosition: Duration(seconds: positionSeconds),
    ),
    loadingState: isLoading ? .processing : .completed,
    mediaItem: MediaItem(
      id: 'widgetbook-player-controls',
      title: 'Player controls preview',
      duration: Duration(seconds: durationSeconds),
    ),
  );

  return ColoredBox(
    color: Colors.black,
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: PlayerControls(
          chantingState: state,
          onNextPressed: () {},
          onPlayPausePressed: () {},
          onPreviousPressed: () {},
          onPlaylistPressed: () {},
          isNextEnabled: isNextEnabled,
          isPreviousEnabled: isPreviousEnabled,
          showProgressBar: showProgressBar,
          showTime: showTime,
        ),
      ),
    ),
  );
}
