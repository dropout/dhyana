// import 'dart:convert';
//
// import 'package:dhyana/model/all.dart';
//
// /// A codec that can serialize [TimerSettings].
// class TimerSettingsExtraCodec extends Codec<Object?, Object?> {
//
//   /// Create a codec.
//
//   const TimerSettingsExtraCodec();
//   @override
//   Converter<Object?, Object?> get decoder => const _TimerSettingsExtraDecoder();
//
//   @override
//   Converter<Object?, Object?> get encoder => const _TimerSettingsExtraEncoder();
// }
//
// class _TimerSettingsExtraDecoder extends Converter<Object?, Object?> {
//
//   const _TimerSettingsExtraDecoder();
//
//   @override
//   Object? convert(Object? input) {
//     if (input == null) {
//       return null;
//     }
//     final List<Object?> inputAsList = input as List<Object?>;
//     if (inputAsList[0] == 'TimerSettings') {
//       return TimerSettings(inputAsList[1]! as String);
//     }
//     throw FormatException('Unable to parse input: $input');
//   }
// }
//
// class _TimerSettingsExtraEncoder extends Converter<Object?, Object?> {
//
//   const _TimerSettingsExtraEncoder();
//
//   @override
//   Object? convert(Object? input) {
//     if (input == null) {
//       return null;
//     }
//     switch (input) {
//       case TimerSettings _:
//         return <Object?>['TimerSettings', input.data];
//       default:
//         throw FormatException('Cannot encode type ${input.runtimeType}');
//     }
//   }
// }
