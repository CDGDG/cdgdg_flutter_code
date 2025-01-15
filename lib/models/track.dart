// ignore_for_file: invalid_annotation_target

import 'package:cdgdg_flutter_code/dio/dio.dart';
import 'package:cdgdg_flutter_code/models/artist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  const factory Track({
    required String name,
    required String playcount,
    required String listeners,
    required String url,
    required Artist artist,
    @JsonKey(fromJson: _extractLargeImage) required String image,
  }) = _Track;

  factory Track.fromJson(Json json) => _$TrackFromJson(json);
}

// 이미지 사이즈별 리스트에서 Large만 추출
String _extractLargeImage(List images) {
  final largeImage = images.firstWhere(
    (image) => image["size"] == "large",
    orElse: () => images.first,
  );
  return largeImage["#text"];
}
