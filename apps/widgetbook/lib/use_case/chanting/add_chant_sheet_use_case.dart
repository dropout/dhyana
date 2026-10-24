// ignore_for_file: implementation_imports

import 'package:chanting/chanting.dart';
import 'package:chanting/src/public/view/chanting_settings/add_chant_sheet.dart';
import 'package:core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _chantNames = [
  'Thousand Eyes and Hands Sutra',
  'Heart Sutra (Korean)',
  'Great Dharani',
  'Great Dharani 3x',
];

final _fixtureChants = List<Chant>.generate(
  _chantNames.length,
  (index) => Chant(
    id: 'preview-chant-$index',
    name: _chantNames[index],
    order: index,
    blurHash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
    length: Duration(minutes: 3 + index, seconds: 15),
    metaData: ChantMetaData(
      id: 'preview-chant-$index',
      audioVersion: 1,
      lyricsVersion: 1,
      coverVersion: 1,
      audioSha256: '',
      lyricsSha256: '',
      coverSha256: '',
      audioBytes: 0,
      lyricsBytes: 0,
      coverBytes: 0,
      updatedAt: DateTime(2024),
    ),
  ),
);

@widgetbook.UseCase(
  name: 'Available chants',
  type: AddChantSheet,
  path: '[Chanting]/public/view/chanting_settings/',
)
Widget buildAddChantSheetAvailable(BuildContext context) {
  return _AddChantSheetPreview(availableChants: _fixtureChants);
}

@widgetbook.UseCase(
  name: 'Empty state',
  type: AddChantSheet,
  path: '[Chanting]/public/view/chanting_settings/',
)
Widget buildAddChantSheetEmpty(BuildContext context) {
  return const _AddChantSheetPreview(availableChants: []);
}

class _AddChantSheetPreview extends StatefulWidget {
  const _AddChantSheetPreview({required this.availableChants});

  final List<Chant> availableChants;

  @override
  State<_AddChantSheetPreview> createState() => _AddChantSheetPreviewState();
}

class _AddChantSheetPreviewState extends State<_AddChantSheetPreview> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
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
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                useRootNavigator: false,
                builder: (sheetContext) => SizedBox(
                  height: MediaQuery.of(sheetContext).size.height * 0.75,
                  child: AddChantSheet(availableChants: widget.availableChants),
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
