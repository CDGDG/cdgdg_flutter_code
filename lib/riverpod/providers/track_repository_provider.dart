import 'package:cdgdg_flutter_code/repositories/repositories.dart';
import 'package:cdgdg_flutter_code/riverpod/riverpod.dart';
import 'package:riverpod/riverpod.dart';

final trackRepositoryProvider = Provider<TrackRepository>((ref) {
  final dio = ref.read(dioProvider);
  return TrackRepository(dio);
});
