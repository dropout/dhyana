import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';

/// Toggle button that switches the home screen between the timer settings view
/// and the chanting settings view. The widget uses callback pattern to notify
/// parent of mode changes.
class SessionModeToggle extends StatelessWidget {
  const SessionModeToggle({
    required this.activeMode,
    required this.onModeChanged,
    super.key,
    this.padding,
  });

  final SessionType activeMode;
  final ValueChanged<SessionType> onModeChanged;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: DesignSpec.paddingLg,
            vertical: DesignSpec.paddingMd,
          ),
      child: SizedBox(
        width: double.infinity,
        child: SegmentedButton<SessionType>(
          segments: <ButtonSegment<SessionType>>[
            ButtonSegment<SessionType>(
              value: SessionType.sitting,
              icon: const Icon(Icons.timer_outlined),
              label: Text(l10n.sessionModeTimerLabel),
            ),
            ButtonSegment<SessionType>(
              value: SessionType.chanting,
              icon: const Icon(Icons.music_note),
              label: Text(l10n.sessionModeChantingLabel),
            ),
          ],
          selected: <SessionType>{activeMode},
          showSelectedIcon: false,
          onSelectionChanged: (selection) {
            if (selection.isEmpty) {
              return;
            }
            onModeChanged(selection.first);
          },
        ),
      ),
    );
  }

}
