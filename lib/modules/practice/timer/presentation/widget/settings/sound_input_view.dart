import 'package:carousel_slider/carousel_slider.dart';
import 'package:dhyana/service/simple_audio_service.dart';
import 'package:dhyana/util/enum_helper.dart';
import 'package:dhyana/util/localization.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'input_view.dart';

class SoundInputCard extends StatelessWidget {
  final Sound sound;
  final VoidCallback onTap;

  const SoundInputCard({required this.sound, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
        boxShadow: DesignSpec.defaultBoxShadow,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(DesignSpec.borderRadiusMd),
                    topRight: Radius.circular(DesignSpec.borderRadiusMd),
                  ),
                  image: DecorationImage(
                    image: AssetImage(sound.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SizedBox.expand(),
              ),
            ),
            SizedBox(
              height: 32,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(DesignSpec.borderRadiusMd),
                    bottomRight: Radius.circular(DesignSpec.borderRadiusMd),
                  ),
                  color: Colors.black,
                ),
                child: SizedBox.expand(
                  child: Center(
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
            ),
          ],
        ),
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
  late final SimpleAudioService audioService;
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    audioService = SimpleAudioService(soloud: SoLoud.instance);
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

  void _onInputCardTap(BuildContext context, Sound sound) async {
    if (sound == Sound.vibrate) {
      context.services.hapticsService.patternFromData(Sound.vibrate.assetPath);
    } else {
      audioService.play(sound);
    }
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
              aspectRatio: 16 / 9,
              enlargeFactor: .33,
              enableInfiniteScroll: false,
              enlargeCenterPage: true, // This pushes the item to the center
              viewportFraction:
                  0.6, // Controls how much of the side items you see
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
                    child: SoundInputCard(
                      sound: i,
                      onTap: () => _onInputCardTap(context, i),
                    ),
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

  @override
  void dispose() {
    tabController.dispose();
    audioService.stop();
    audioService.dispose();
    super.dispose();
  }
}
