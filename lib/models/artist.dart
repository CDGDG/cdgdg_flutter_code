import 'package:cdgdg_flutter_code/dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artist.freezed.dart';
part 'artist.g.dart';

@freezed
class Artist with _$Artist {
  const factory Artist({
    required String name,
    required String url,
  }) = _Artist;

  factory Artist.fromJson(Json json) => _$ArtistFromJson(json);
}
