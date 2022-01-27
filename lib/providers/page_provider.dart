import 'package:beathouse/pages/library.dart';
import 'package:beathouse/pages/player.dart';
import 'package:beathouse/pages/settings.dart';
import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int _currentPage = 0;

  final List<Widget> _pages = [
    const Player(),
    const Library(),
    const Settings(),
  ];

  Widget get currentPage => _pages[_currentPage];

  void toPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
