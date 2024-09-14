import 'package:flutter/material.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_button.dart';

class DurationInputView extends StatefulWidget {

  final void Function(Duration duration)? onSelect;
  final Duration? initialValue;
  final List<int> values;
  final String title;

  const DurationInputView({
    this.initialValue,
    this.onSelect,
    this.title = '',
    required this.values,
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
      int indexOfInitialValue = widget.values.indexOf(minutes);
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
    widget.onSelect?.call(Duration(minutes: widget.values[selectedIndex]));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            title: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              )
            ),
            automaticallyImplyLeading: false,
          ),
          SizedBox(
            height: 300,
            child: ListWheelScrollView(
              controller: scrollController,
              physics: scrollPhysics,
              itemExtent: 48,
              children: widget.values.map((int value) {
                String text;
                TextStyle textStyle;
                if (value == widget.values[selectedIndex]) {
                  text = AppLocalizations.of(context).minutesPlural(value);
                  textStyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  );
                } else {
                  text = value.toString();
                  textStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
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
                  ));
              }).toList() ,
              onSelectedItemChanged: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            )
          ),
          Padding(
            padding: const EdgeInsets.all(AppThemeData.spacingMd),
            child: AppButton(
              text: AppLocalizations.of(context).okay.toUpperCase(),
              onTap: () => _onSelectButtonPress(context),
            ),
          )
        ],
      ),
    );
  }

}
