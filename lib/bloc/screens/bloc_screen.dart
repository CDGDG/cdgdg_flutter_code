import 'package:cdgdg_flutter_code/bloc/bloc.dart';
import 'package:cdgdg_flutter_code/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopTracksGetCubit(context.read<MusicRepository>())..getTopTracks(),
      child: const _BlocView(),
    );
  }
}

class _BlocView extends StatelessWidget {
  const _BlocView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<TopTracksGetCubit, TopTracksGetState>(
          builder: (context, state) => Center(
            child: state.maybeWhen(
              orElse: CircularProgressIndicator.new,
              unauthorized: () => Text("API Key가 유효하지 않습니다."),
              error: (message) => Text(message),
              loaded: (tracks) => ListView.separated(
                itemCount: tracks.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final track = tracks[index];
                  return ListTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        Text(
                          "${index + 1}.",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Image.network(track.image),
                      ],
                    ),
                    title: Text(
                      track.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(track.artist.name),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${track.playcount} play"),
                        Text("${track.listeners} listeners"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
