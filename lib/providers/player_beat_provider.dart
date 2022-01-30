import 'package:flutter/material.dart';

class PlayerBeatProvider extends ChangeNotifier {
  int _currentBeat = 80;
  final TextEditingController _controller = TextEditingController();

  PlayerBeatProvider() {
    _updateText();
  }

  int get currentBeat => _currentBeat;

  TextEditingController get controller => _controller;

  // Maybe put here the timer start
  void increase() {
    _currentBeat++;
    _updateText();
    notifyListeners();
  }

  // ... or here
  void decrease() {
    _currentBeat--;
    _updateText();
    notifyListeners();
  }

  void _updateText() {
    _controller.text = '$_currentBeat';
  }
}
