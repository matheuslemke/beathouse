import 'dart:async';

import 'package:beathouse/providers/player_beat_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PlayerSoundProvider extends ChangeNotifier {
  bool _isPlaying = false;

  get isPlaying => _isPlaying;

  void playPause(BuildContext context) {
    _isPlaying = !_isPlaying;
    _click(context);
    notifyListeners();
  }

  void _click(BuildContext context) {
    Timer(
        Duration(
            milliseconds:
                60000 ~/ context.read<PlayerBeatProvider>().currentBeat), () {
      SystemSound.play(SystemSoundType.click);
      debugPrint('click');
      if (_isPlaying) {
        _click(context);
      }
    });
  }
}
