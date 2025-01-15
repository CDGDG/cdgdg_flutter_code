import 'package:cdgdg_flutter_code/bloc/bloc.dart';
import 'package:cdgdg_flutter_code/dio/dio.dart';
import 'package:cdgdg_flutter_code/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopTracksGetCubit extends Cubit<TopTracksGetState> {
  TopTracksGetCubit(this._repository) : super(const TopTracksGetState.init());
  final MusicRepository _repository;

  Future<void> getTopTracks() async {
    emit(const TopTracksGetState.loading());
    try {
      final topTracks = await _repository.getTopTracks();
      emit(TopTracksGetState.loaded(topTracks));
    } on ApiKeyException {
      emit(const TopTracksGetState.unauthorized());
    } catch (e) {
      emit(TopTracksGetState.error("Error!"));
    }
  }
}
