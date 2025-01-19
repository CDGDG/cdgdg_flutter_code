import 'package:cdgdg_flutter_code/bloc/bloc.dart';
import 'package:cdgdg_flutter_code/dio/dio.dart';
import 'package:cdgdg_flutter_code/repositories/track_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const CdgdgFlutterCode());
}

class CdgdgFlutterCode extends StatelessWidget {
  const CdgdgFlutterCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Client.instance,
      child: RepositoryProvider(
        create: (context) => TrackRepository(context.read<Dio>()),
        child: MaterialApp(
          title: 'CDGDG Flutter Code',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: BlocScreen(),
        ),
      ),
    );
  }
}
