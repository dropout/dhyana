import 'package:carousel_slider/carousel_slider.dart';
import 'package:dhyana/service/timer_audio_service.dart';
import 'package:dhyana/util/enum_helper.dart';
import 'package:dhyana/util/localization.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/timer/settings/sound_input_play_button.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'input_view.dart';

class SoundInputCard extends StatelessWidget {

  final Sound sound;
  final TimerAudioService audioService;

  const SoundInputCard({
    required this.sound,
    required this.audioService,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {        
        audioService.playSound(sound);
      },
      child: Stack(
        children: [       
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.lerp(
                  AppColors.backgroundPaperLight,
                  Colors.white,
                  0.33,
                )!,
                width: 1.0,
              ),
              boxShadow: DesignSpec.defaultBoxShadow,
              borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
              image: DecorationImage(
                image: AssetImage(sound.imageResourcePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: .bottomCenter,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: DesignSpec.paddingSm,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(DesignSpec.borderRadiusMd),
                    bottomRight: Radius.circular(DesignSpec.borderRadiusMd),
                  ),
                ),
                child: Text(
                  getLocalizedSoundName(sound, context.l10n),
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SoundInputPlayButton(              
              sound: sound,
              audioService: audioService,
            ),
          ),
        ],
      ),
    );
  }
}

class SoundInputView extends StatefulWidget {
  final String title;
  final void Function(Sound sound)? onSelect;
  final Sound? initialValue;

  const SoundInputView({
    this.title = '',
    this.initialValue,
    this.onSelect,
    super.key,
  });

  @override
  State<SoundInputView> createState() => SoundInputViewState();
}

class SoundInputViewState extends State<SoundInputView>
    with TickerProviderStateMixin {
  late final TimerAudioService audioService;
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    audioService = TimerAudioService(context.services.audioHandler);
    tabController = TabController(length: Sound.values.length, vsync: this);

    if (widget.initialValue != null) {
      final int initialIndex = getEnumIndex(widget.initialValue, Sound.values);
      tabController.index = initialIndex;
      selectedIndex = initialIndex;
    }

    super.initState();
  }

  void _onSelectButtonPress() {
    widget.onSelect?.call(getEnumByIndex(selectedIndex, Sound.values));
    context.hapticsTap();
  }

  void _onIndexChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
    audioService.stop();
    tabController.index = index;
    context.services.hapticsService.select();
  }

  @override
  Widget build(BuildContext context) {
    return InputView(
      title: widget.title,
      onSave: _onSelectButtonPress,
      child: buildInputViewContent(context),
    );
  }

  Widget buildInputViewContent(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        SizedBox(
          height: 200,
          child: CarouselSlider(                        
            options: CarouselOptions(
              aspectRatio: 1.6,
              enlargeFactor: .33,
              enableInfiniteScroll: false,
              enlargeCenterPage: true, // This pushes the item to the center
              viewportFraction:
                  0.5, // Controls how much of the side items you see
              initialPage: selectedIndex,
              onPageChanged: (index, reason) => _onIndexChanged(index),
            ),
            items: Sound.values.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: DesignSpec.paddingSm,
                    ),
                    child: SoundInputCard(sound: i, audioService: audioService),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 48,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: selectedIndex,
              count: Sound.values.length,
              effect: WormEffect(
                activeDotColor: Colors.black,
                dotColor: Colors.black.withValues(alpha: 0.2),
                dotHeight: 12.0,
                dotWidth: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPlayButton(BuildContext context) {
    return SoundInputPlayButton(
      audioService: audioService,
      sound: getEnumByIndex(selectedIndex, Sound.values),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    audioService.stop();
    super.dispose();
  }
}
