import 'package:freezed_annotation/freezed_annotation.dart';

part 'chant_playlist_item.freezed.dart';

@freezed
sealed class ChantPlaylistItem with _$ChantPlaylistItem {
  const ChantPlaylistItem._();

  const factory ChantPlaylistItem({ 

    required String id,

    /// The identifier of the chant. This is used to look up the chant in the database.
    required String chantId,

    /// The name of the chant.
    required String name,

    /// The blur hash of the chant's cover image.
    required String blurHash,

    /// The order to display the chant in a list.
    required int order,

    /// The length of the chant.
    required Duration duration,
  }) = _ChantPlaylistItem;

}