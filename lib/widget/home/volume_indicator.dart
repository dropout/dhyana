import 'dart:async';

import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_volume_listener/flutter_volume_listener.dart';

/// A widget that displays the current volume level of the device as a percentage and an icon.
/// The purpose of this widget is to alert the user that the volume is too low for the app to function properly.
class VolumeIndicator extends StatefulWidget {
  /// The threshold above which the volume indicator will be hidden.
  final double visibilityThreshold;

  /// Whether to show the volume indicator when the volume changes above the threshold.
  final bool showOnVolumeChangeAboveThreshold;

  /// The duration to wait before fading out the volume indicator.
  final Duration waitDuration;

  /// The duration of the fade out animation.
  final Duration fadeDuration;

  const VolumeIndicator({
    this.visibilityThreshold = 0.25,
    this.showOnVolumeChangeAboveThreshold = true,
    this.waitDuration = const Duration(milliseconds: 1600),
    this.fadeDuration = const Duration(milliseconds: 500),
    super.key,
  });

  @override
  State<VolumeIndicator> createState() => _VolumeIndicatorState();
}

class _VolumeIndicatorState extends State<VolumeIndicator>
    with SingleTickerProviderStateMixin {
  final flutterVolumeListener = FlutterVolumeListener();
  double _currentVolume = 0.0;
  StreamSubscription<double>? _volumeStreamSub;

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    initPlatformState();

    // let's build an animatino controller that will animate the opacity of the volume indicator when the volume changes above the threshold.
    final totalDuration = widget.waitDuration + widget.fadeDuration;
    _animationController = AnimationController(
      vsync: this,
      duration: totalDuration,
    );

    // Calculate the intervals based on wait and fade durations
    final waitRatio =
        widget.waitDuration.inMilliseconds / totalDuration.inMilliseconds;
    // final fadeRatio =
    //     widget.fadeDuration.inMilliseconds / totalDuration.inMilliseconds;

    // let's build an animation that will hold the opacity for a brief moment before fading out using chained tweens.
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0)
        .chain(
          CurveTween(curve: Interval(0.0, waitRatio, curve: Curves.linear)),
        )
        .chain(
          CurveTween(curve: Interval(waitRatio, 1.0, curve: Curves.easeOut)),
        )
        .animate(_animationController);


  }

  @override
  void dispose() {
    _volumeStreamSub?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> initPlatformState() async {
    flutterVolumeListener.volume.then((value) {
      setState(() {
        _currentVolume = value;
        if (widget.showOnVolumeChangeAboveThreshold && _currentVolume >= widget.visibilityThreshold) {
          _animationController.forward(from: 0.0);
        }
      });
    });

    _volumeStreamSub = flutterVolumeListener.onVolumeChanged.listen((volume) {
      setState(() {
        _currentVolume = volume;
        if (widget.showOnVolumeChangeAboveThreshold && _currentVolume >= widget.visibilityThreshold) {          
          _animationController.forward(from: 0.0);
        }        
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    if (_currentVolume < widget.visibilityThreshold) {
      return buildIndicator(context);
    } else if (widget.showOnVolumeChangeAboveThreshold && _currentVolume >= widget.visibilityThreshold) {
      return AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: buildIndicator(context),
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }   
  }

  Widget buildIndicator(BuildContext context) {
      return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignSpec.paddingMd),
        child: Row(
          children: [
            Icon(getVolumeIcon(_currentVolume), color: Colors.white),
            Gap.xs(),
            Text(
              '${(_currentVolume * 100).toInt()}%',
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: getVolumeColor(_currentVolume),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A function that returns different versions of the volume icon based on the current volume level.
  IconData getVolumeIcon(double volume) {
    if (volume == 0) {
      return Icons.volume_off;
    } else if (volume < 0.25) {
      return Icons.volume_down;
    } else {
      return Icons.volume_up;
    }
  }

  // a function that returns a color based on the current volume level.
  Color getVolumeColor(double volume) {
    if (volume < 0.1) {
      return Colors.red;
    } else if (volume < 0.25) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

}
