import 'package:freezed_annotation/freezed_annotation.dart';

part 'chant_playlist_item.freezed.dart';
part 'chant_playlist_item.g.dart';

@freezed
sealed class ChantPlaylistItem with _$ChantPlaylistItem {
  const ChantPlaylistItem._();

  const factory ChantPlaylistItem({ 

    // This is a unique identifier for this item. This is used as a key in the list
    // so that multiple instances of the same chant can be added to the list and reordered.
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

  factory ChantPlaylistItem.fromJson(Map<String, dynamic> json) =>
      _$ChantPlaylistItemFromJson(json);

}