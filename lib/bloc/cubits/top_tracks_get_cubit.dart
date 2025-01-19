import 'package:cdgdg_flutter_code/bloc/bloc.dart';
import 'package:cdgdg_flutter_code/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopTracksGetCubit extends Cubit<TopTracksGetState> {
  TopTracksGetCubit(this._repository) : super(const TopTracksGetState.init());
  final TrackRepository _repository;

  Future<void> getTopTracks() async {
    emit(const TopTracksGetState.loading());
    try {
      final topTracks = await _repository.getTopTracks();
      emit(TopTracksGetState.loaded(topTracks));
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 403) return emit(TopTracksGetState.unauthorized());
      emit(TopTracksGetState.error("Error!"));
    }
  }
}
