import 'package:dhyana/widget/timer/settings/sound_input_page.dart';
import 'package:dhyana/widget/timer/settings/sound_input_play_button.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/util/all.dart';

import 'input_view.dart';
import 'sound_input_page_view_scroll_physics.dart';

class SoundInputView extends StatefulWidget {

  final String title;
  final void Function(Sound sound)? onSelect;
  final Sound? initialValue;

  const SoundInputView({
    this.title = '',
    this.initialValue,
    this.onSelect,
    super.key
  });

  @override
  State<SoundInputView> createState() => SoundInputViewState();
}

class SoundInputViewState extends State<SoundInputView>
  with TickerProviderStateMixin {

  late PageController pageController;
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      length: Sound.values.length,
      vsync: this
    );

    if (widget.initialValue != null) {
      final int initialIndex = getEnumIndex(widget.initialValue, Sound.values);
      tabController.index = initialIndex;
      pageController = PageController(initialPage: initialIndex);
      selectedIndex = initialIndex;
    } else {
      pageController = PageController();
    }

    super.initState();
  }

  void _onSelectButtonPress(BuildContext context) {
    widget.onSelect?.call(getEnumByIndex(selectedIndex, Sound.values));
  }

  void _onPageChanged(BuildContext context, int index) {
    setState(() {
      selectedIndex = index;
    });
    tabController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    return InputView(
      title: widget.title,
      onSave: () => _onSelectButtonPress(context),
      child: buildInputViewContent(context),
    );
  }

  Widget buildInputViewContent(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 192,
          child: PageView(
            onPageChanged: (int index) => _onPageChanged(context, index),
            controller: pageController,
            physics: const SoundInputPageViewScrollPhysics(),
            children: Sound.values.map((Sound s) => SoundInputPage(
              audioService: context.services.audioService,
              sound: s,
            )).toList(),
          ),
        ),
        buildPlayButton(context),
        SizedBox(
          height: 48,
          child: Center(
            child: TabPageSelector(
              controller: tabController,
              color: Colors.black.withValues(alpha: 0.2),
              selectedColor: Colors.black,
              borderStyle: BorderStyle.none,
            ),
          ),
        )
      ],
    );
  }

  Widget buildPlayButton(BuildContext context) {
    return SoundInputPlayButton(
      audioService: context.services.audioService,
      sound: getEnumByIndex(selectedIndex, Sound.values),
    );
  }

}
