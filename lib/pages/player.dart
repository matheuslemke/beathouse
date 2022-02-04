import 'package:beathouse/providers/player_beat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 80,
            child: TextField(
              controller: context.read<PlayerBeatProvider>().controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onSubmitted: (v) {
                context.read<PlayerBeatProvider>().setCurrentBeat(int.parse(v));
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<PlayerBeatProvider>().decrease();
              },
              child: const Icon(Icons.remove),
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<PlayerBeatProvider>().increase();
              },
              child: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {
            context.read<PlayerBeatProvider>().playPause();
          },
          child: context.watch<PlayerBeatProvider>().isPlaying
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
        )
      ],
    );
  }
}
