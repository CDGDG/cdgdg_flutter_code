import 'package:cdgdg_flutter_code/models/models.dart';
import 'package:cdgdg_flutter_code/riverpod/riverpod.dart';
import 'package:riverpod/riverpod.dart';

final topTracksProvider = FutureProvider<List<Track>>(
  (ref) async {
    final repository = ref.read(trackRepositoryProvider);
    return repository.getTopTracks();
  },
);
