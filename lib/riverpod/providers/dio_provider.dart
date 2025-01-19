import 'package:cdgdg_flutter_code/dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Client.instance);
