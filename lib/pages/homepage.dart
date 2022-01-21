import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem player = const BottomNavigationBarItem(
        icon: Icon(Icons.surround_sound), label: 'Player');
    BottomNavigationBarItem folder = const BottomNavigationBarItem(
        icon: Icon(Icons.folder), label: 'Folder');
    BottomNavigationBarItem settings = const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings');

    AppBar appBar = AppBar(
      title: const Text('Beathouse'),
    );

    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [player, folder, settings],
    );

    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
