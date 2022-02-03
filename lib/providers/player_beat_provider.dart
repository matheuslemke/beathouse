import 'package:beathouse/providers/player_sound_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerBeatProvider extends ChangeNotifier {
  int _currentBeat = 80;
  final TextEditingController _controller = TextEditingController();

  PlayerBeatProvider() {
    _updateText();
  }

  int get currentBeat => _currentBeat;
  TextEditingController get controller => _controller;

  void increase() {
    _currentBeat++;
    _updateText();
    notifyListeners();
  }

  void decrease() {
    _currentBeat--;
    _updateText();
    notifyListeners();
  }

  void setCurrentBeat(int beat, BuildContext context) {
    _currentBeat = beat;
    // check if is playing
    context.read<PlayerSoundProvider>().cancelTimer(context);
    notifyListeners();
  }

  void _updateText() {
    _controller.text = '$_currentBeat';
  }
}
