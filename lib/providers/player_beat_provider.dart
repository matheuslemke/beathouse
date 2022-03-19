import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayerBeatProvider extends ChangeNotifier {
  bool _isPlaying = false;
  int _currentBeat = 80;
  Timer _timer = Timer(Duration.zero, () {});
  final TextEditingController _controller = TextEditingController();

  PlayerBeatProvider() {
    _updateText();
  }

  get isPlaying => _isPlaying;
  TextEditingController get controller => _controller;

  void setCurrentBeat(int beat) {
    _currentBeat = beat;
    if (_isPlaying) {
      _cancelTimer();
      _click();
    }
    _updateText();
  }

  void playPause() {
    if (_isPlaying) {
      _cancelTimer();
    } else {
      _click();
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void increase() {
    /// Here the current timer is being stopped and started another one.
    /// Maybe should await the previous timer?
    setCurrentBeat(++_currentBeat);
    _updateText();
    notifyListeners();
  }

  void decrease() {
    setCurrentBeat(--_currentBeat);
    _updateText();
    notifyListeners();
  }

  void _updateText() {
    _controller.text = '$_currentBeat';
  }

  void _cancelTimer() {
    _timer.cancel();
  }

  void _click() {
    debugPrint(_currentBeat.toString() + ' click');

    _timer = Timer(Duration(milliseconds: 60000 ~/ _currentBeat), () {
      SystemSound.play(SystemSoundType.click);
      if (_isPlaying) {
        _click();
      }
    });
  }
}
