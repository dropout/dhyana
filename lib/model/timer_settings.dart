import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:dhyana/enum/sound.dart';

part 'timer_settings.freezed.dart';
part 'timer_settings.g.dart';

@freezed
class TimerSettings with _$TimerSettings {

  const TimerSettings._();

  const factory TimerSettings({
    @Default(Duration(minutes: 1)) Duration warmup,
    @Default(Duration(minutes: 10)) Duration duration,
    @Default(Sound.none) Sound startingSound,
    @Default(Sound.none) Sound endingSound,
  }) = _TimerSettings;

  factory TimerSettings.fromJson(Map<String, Object?> json) =>
    _$TimerSettingsFromJson(json);

  factory TimerSettings.fromFireStore(DocumentSnapshot snapshot) =>
    TimerSettings.fromJson(snapshot.data() as Map<String, dynamic>);
}


//
// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
// import 'package:dhyana/enum/sound.dart';
// import 'package:dhyana/util/all.dart';
//
// class TimerSettings extends Equatable {
//
//   final Duration warmup;
//   final Duration duration;
//   final Sound startingSound;
//   final Sound endingSound;
//
//   const TimerSettings({
//     this.warmup = Duration.zero,
//     required this.duration,
//     this.startingSound = Sound.none,
//     this.endingSound = Sound.none,
//   });
//
//   TimerSettings copyWith({
//     Duration? warmup,
//     Duration? duration,
//     Sound? startingSound,
//     Sound? endingSound
//   }) {
//     return TimerSettings(
//       warmup: warmup ?? this.warmup,
//       duration: duration ?? this.duration,
//       startingSound: startingSound ?? this.startingSound,
//       endingSound: endingSound ?? this.endingSound
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//     warmup,
//     duration,
//     startingSound,
//     endingSound
//   ];
//
//   @override
//   String toString() {
//     return 'TimerSettings { '
//       'warmup: $warmup, '
//       'duration: $duration, '
//       'startingSound: $startingSound, '
//       'endingSound: $endingSound, '
//     '}';
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'warmup': warmup.inSeconds.toString(),
//       'duration': duration.inSeconds.toString(),
//       'startingSound': describeEnum(startingSound),
//       'endingSound': describeEnum(endingSound),
//     };
//   }
//
//   static TimerSettings fromJson(Map<String, dynamic> map) {
//     Sound? startingSound = getEnumFromString(map['startingSound'], Sound.values);
//     Sound? endingSound = getEnumFromString(map['endingSound'], Sound.values);
//     return TimerSettings(
//       warmup: Duration(seconds: int.parse(map['warmup'] as String, radix: 10)),
//       duration: Duration(seconds: int.parse(map['duration'] as String, radix: 10)),
//       startingSound: (startingSound == null) ? Sound.none : startingSound,
//       endingSound: (endingSound == null) ? Sound.none : endingSound,
//     );
//   }
//
// }
