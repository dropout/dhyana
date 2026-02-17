part of 'chanting_settings_cubit.dart';

@freezed
sealed class ChantingSettingsState with _$ChantingSettingsState {

  const ChantingSettingsState._();

  const factory ChantingSettingsState({
    required List<Chant> availableChants,
    required List<Chant> selectedChants,
    required bool isLoading,
    String? error,
  }) = _ChantingSettingsState;

  factory ChantingSettingsState.initial() {
    return ChantingSettingsState(
      availableChants: const [],
      selectedChants: const [],
      isLoading: false,
    );
  }

}
