import 'package:cdgdg_flutter_code/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_tracks_get_state.freezed.dart';

@freezed
class TopTracksGetState with _$TopTracksGetState {
  const factory TopTracksGetState.init() = _Init;
  const factory TopTracksGetState.loading() = _Loading;
  const factory TopTracksGetState.loaded(List<Track> tracks) = _Loaded;
  const factory TopTracksGetState.error(String message) = _Error;
  const factory TopTracksGetState.unauthorized() = _Unauthorized;
}
