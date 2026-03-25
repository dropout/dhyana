import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/timer/settings/input_view.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

class DurationInputView extends StatefulWidget {

  final List<int> availableValues;
  final Duration? initialValue;
  final String title;
  final void Function(Duration duration)? onSelect;

  const DurationInputView({
    required this.availableValues,
    this.initialValue,
    this.title = '',
    this.onSelect,
    super.key
  });

  @override
  State<DurationInputView> createState() => _DurationInputViewState();

}

class _DurationInputViewState extends State<DurationInputView> with TickerProviderStateMixin {

  late ScrollController scrollController;
  late ScrollPhysics scrollPhysics;
  late int selectedIndex;

  @override
  void initState() {
    if (widget.initialValue != null) {
      int minutes = widget.initialValue!.inMinutes;
      int indexOfInitialValue = widget.availableValues.indexOf(minutes);
      selectedIndex = (indexOfInitialValue >= 0) ? indexOfInitialValue : 0;
    } else {
      selectedIndex = 0;
    }

    scrollController = FixedExtentScrollController(
      initialItem: selectedIndex,
    );
    scrollPhysics = const FixedExtentScrollPhysics();

    super.initState();
  }

  void _onSelectButtonPress(BuildContext context) {
    widget.onSelect?.call(
      Duration(minutes: widget.availableValues[selectedIndex])
    );
  }

  @override
  Widget build(BuildContext context) {
    return InputView(
      title: widget.title,
      onSave: () => _onSelectButtonPress(context),
      child: buildListWheelScollView(context),
    );
  }

  Widget buildListWheelScollView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: DesignSpec.padding2Xl,
      ),
      child: SizedBox(
        height: 300,
        child: ListWheelScrollView(
          controller: scrollController,
          physics: scrollPhysics,
          itemExtent: 48,
          children: buildListWheelScrollViewChildren(context),
          onSelectedItemChanged: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        )
      ),
    );
  }

  List<Widget> buildListWheelScrollViewChildren(BuildContext context) {
    return widget.availableValues.map((int value) {

      String text;
      TextStyle textStyle;
      if (value == widget.availableValues[selectedIndex]) {
        text = context.l10n.minutesPluralWithNumber(value);
        textStyle = context.theme.textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.w800,
          color: Colors.black,
        );
      } else {
        text = value.toString();
        textStyle = context.theme.textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w600,
        );
      }

      return SizedBox(
        height: 48,
        child: AnimatedDefaultTextStyle(
          style: textStyle,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          child: Center(
            child: Text(text),
          ),
        )
      );

    }).toList();
  }

}
