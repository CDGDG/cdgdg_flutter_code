import 'package:cdgdg_flutter_code/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodScreen extends ConsumerWidget {
  const RiverpodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topTracksAsync = ref.watch(topTracksProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: topTracksAsync.maybeWhen(
          orElse: CircularProgressIndicator.new,
          error: (error, stackTrace) => Text("$error"),
          data: (tracks) => ListView.separated(
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
    );
  }
}