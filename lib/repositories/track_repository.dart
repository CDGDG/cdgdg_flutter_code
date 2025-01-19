import 'package:cdgdg_flutter_code/dio/dio.dart';
import 'package:cdgdg_flutter_code/models/models.dart';
import 'package:dio/dio.dart';

class TrackRepository {
  TrackRepository(this._client);
  final Dio _client;

  Future<List<Track>> getTopTracks() async {
    final response = await _client.get(
      "https://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&format=json",
    );
    return ((response.data as Json)["tracks"]["track"] as List).map((json) => Track.fromJson(json)).toList();
  }
}
