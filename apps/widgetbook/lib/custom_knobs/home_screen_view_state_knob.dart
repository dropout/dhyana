import 'package:home/home.dart';
import 'package:widgetbook/widgetbook.dart';

class HomeScreenViewStateKnob extends Knob<HomeScreenViewState> {
  HomeScreenViewStateKnob({required super.label, required super.initialValue});

  @override
  List<Field> get fields => [
    ObjectSegmentedField<HomeScreenViewState>(
      initialValue: HomeScreenViewState.sitting,
      name: 'homeScreenViewState',
      values: HomeScreenViewState.values,
    ),
  ];

  @override
  HomeScreenViewState valueFromQueryGroup(Map<String, String> group) {
    final value = group['homeScreenViewState'];
    if (value == null) return HomeScreenViewState.sitting;
    return HomeScreenViewState.values.firstWhere(
      (e) => e.toString() == value,
      orElse: () => HomeScreenViewState.sitting,
    );
  }
}

extension HomeScreenViewStateKnobBuilder on KnobsBuilder {
  HomeScreenViewState activeMode({
    required String label,
    required HomeScreenViewState initialValue,
  }) {
    final value = onKnobAdded(
      HomeScreenViewStateKnob(label: label, initialValue: initialValue),
    );
    return value ?? HomeScreenViewState.sitting;
  }
}