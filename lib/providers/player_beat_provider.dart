import 'package:flutter/material.dart';

class PlayerBeatProvider extends ChangeNotifier {
  int currentBeat = 80;
  final TextEditingController _controller = TextEditingController();

  PlayerBeatProvider() {
    _updateText();
  }

  TextEditingController get controller => _controller;

  void increase() {
    currentBeat++;
    _updateText();
    notifyListeners();
  }

  void decrease() {
    currentBeat--;
    _updateText();
    notifyListeners();
  }

  void _updateText() {
    _controller.text = '$currentBeat';
  }
}
