import 'package:timer/l10n/timer_localizations.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'input_view.dart';

class const SoundInputCard({
  required final Sound sound,
  required final VoidCallback onTap,
  super.key,
}) extends StatelessWidget {

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
                      sound.getLocalizedName(TimerLocalizations.of(context)),
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
  late PageController _pageController;
  double? _fraction;
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
    const double cardAspectRatio = 4 / 3;
    const double cardHeight = 200;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth =
            (cardHeight - 2 * DesignSpec.paddingSm) * cardAspectRatio;
        _ensurePageController(cardWidth / constraints.maxWidth);

        return Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(
              height: cardHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: Sound.values.length,
                onPageChanged: _onIndexChanged,
                itemBuilder: (context, index) {
                  final sound = Sound.values[index];
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      final double page = _pageController.hasClients
                          ? (_pageController.page ?? selectedIndex.toDouble())
                          : selectedIndex.toDouble();
                      final double scale = (1 - (page - index).abs() * 0.3)
                          .clamp(0.7, 1.0);
                      final double angle = (page - index).clamp(-1.0, 1.0) * 0.1;
                      return Transform.scale(
                        scale: scale,
                        child: Transform.rotate(
                          angle: angle,
                          child: child,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: DesignSpec.paddingSm,
                      ),
                      child: SoundInputCard(
                        sound: sound,
                        onTap: () => _onInputCardTap(context, sound),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 36,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
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
            Gap.large(),
          ],
        );
      },
    );
  }

  // Viewport fraction is fixed per controller, so rebuild it when width changes.
  void _ensurePageController(double fraction) {
    if (_fraction == fraction) return;
    final old = _fraction == null ? null : _pageController;
    _fraction = fraction;
    _pageController = PageController(
      initialPage: selectedIndex,
      viewportFraction: fraction,
    );
    if (old != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => old.dispose());
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    if (_fraction != null) _pageController.dispose();
    audioService.stop();
    audioService.dispose();
    super.dispose();
  }
}
