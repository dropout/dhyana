// ignore_for_file: implementation_imports

import 'package:audio_service/audio_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:chanting/chanting.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/presentation/view/player/playlist_sheet.dart';
import 'package:chanting/src/presentation/viewmodel/chanting_cubit.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class _MockChantingCubit extends MockCubit<ChantingStateEntity> implements ChantingCubit {}

@widgetbook.UseCase(name: 'Playlist preview', type: PlaylistSheet, path: '[Chanting]/internal/view/player/')
Widget buildPlaylistSheet(BuildContext context) {
  final playlistSize = context.knobs.int.slider(label: 'Playlist size', initialValue: 5, min: 1, max: 12);
  final currentIndex = context.knobs.int.slider(
    label: 'Current track',
    initialValue: playlistSize ~/ 2,
    min: 0,
    max: playlistSize - 1,
  );
  final isPlaying = context.knobs.boolean(label: 'Playing', initialValue: true);

  final playlist = List<ChantPlaylistItem>.generate(
    playlistSize,
    (index) => ChantPlaylistItem(
      id: 'preview-playlist-item-$index',
      chantId: 'preview-chant-$index',
      name: switch (index % 4) {
        0 => 'Thousand Eyes and Hands Sutra',
        1 => 'Heart Sutra (Korean)',
        2 => 'Great Dharani',
        _ => 'Heart Sutra (English)',
      },
      blurHash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
      order: index,
      duration: Duration(minutes: 3 + index, seconds: 15),
    ),
  );
  final state = ChantingStateEntity(
    chantingSettings: ChantingSettings(selectedChants: playlist),
    playbackState: PlaybackState(
      playing: isPlaying,
      processingState: AudioProcessingState.ready,
      queueIndex: currentIndex,
    ),
  );

  return _PlaylistSheetPreview(key: ValueKey<(int, int, bool)>((playlistSize, currentIndex, isPlaying)), state: state);
}

class _PlaylistSheetPreview extends StatefulWidget {
  const _PlaylistSheetPreview({required this.state, super.key});

  final ChantingStateEntity state;

  @override
  State<_PlaylistSheetPreview> createState() => _PlaylistSheetPreviewState();
}

class _PlaylistSheetPreviewState extends State<_PlaylistSheetPreview> {
  late final _MockChantingCubit _cubit;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _cubit = _MockChantingCubit();
    whenListen(_cubit, const Stream<ChantingStateEntity>.empty(), initialState: widget.state);
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!context.mounted || Navigator.of(context).canPop()) return;
              showModalBottomSheet<void>(
                context: context,
                enableDrag: false,
                isScrollControlled: true,
                backgroundColor: AppColors.backgroundPaper,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                useRootNavigator: false,
                builder: (sheetContext) => BlocProvider<ChantingCubit>.value(
                  value: _cubit,
                  child: SizedBox(
                    height: MediaQuery.of(sheetContext).size.height * 0.75,
                    child: PlaylistSheet(chantImageProvider: const AssetImage('assets/images/tree.jpg')),
                  ),
                ),
              );
            });
            return const Scaffold(backgroundColor: Colors.transparent);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: DesignSpec().themeData,
      routerConfig: _router,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        ...CoreLocalizations.localizationsDelegates,
        ...ChantingLocalizations.localizationsDelegates,
      ],
      supportedLocales: ChantingLocalizations.supportedLocales,
    );
  }
}
