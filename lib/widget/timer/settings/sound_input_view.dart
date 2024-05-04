import 'package:flutter/material.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/util/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';

import 'package:dhyana/widget/util/app_button.dart';

import 'sound_input_page_view_scroll_physics.dart';

class SoundInputView extends StatefulWidget {

  final String title;
  final void Function(Sound sound)? onSelect;
  final Sound? initialValue;

  const SoundInputView({
    required this.title,
    this.initialValue,
    this.onSelect,
    super.key
  });

  @override
  State<SoundInputView> createState() => _SoundInputViewState();
}

class _SoundInputViewState extends State<SoundInputView> with TickerProviderStateMixin {

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
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            child: PageView(
              onPageChanged: (int index) => _onPageChanged(context, index),
              controller: pageController,
              physics: const SoundInputPageViewScrollPhysics(),
              children: Sound.values.map((Sound s) => buildPage(
                context, s
              )).toList(),
            ),
          ),
          SizedBox(
            height: 48,
            child: Center(
              child: TabPageSelector(
                controller: tabController,
                color: Colors.black.withOpacity(0.2),
                selectedColor: Colors.black,
                borderStyle: BorderStyle.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppThemeData.spacingMd,
              0.0,
              AppThemeData.spacingMd,
              AppThemeData.spacingMd,
            ),
            child: AppButton(
              text: AppLocalizations.of(context).okay.toUpperCase(),
              fColor: Colors.white,
              bColor: Colors.black,
              onTap: () => _onSelectButtonPress(context),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPage(BuildContext context, Sound sound) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(sound.imageResourcePath)
            )
          ),
        ),
        const SizedBox(height: AppThemeData.spacingLg),
        Text(
          getLocalizedSoundName(sound, AppLocalizations.of(context)),
          style: Theme.of(context).textTheme.titleMedium
        )
      ]
    );
  }

}
