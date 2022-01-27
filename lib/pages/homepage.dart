import 'package:beathouse/providers/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem player = const BottomNavigationBarItem(
        icon: Icon(Icons.surround_sound), label: 'Player', tooltip: 'Player');
    BottomNavigationBarItem library = const BottomNavigationBarItem(
        icon: Icon(Icons.folder), label: 'Library', tooltip: 'Library');
    BottomNavigationBarItem settings = const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings', tooltip: 'Settings');

    AppBar appBar = AppBar(
      title: const Text('Beathouse'),
    );

    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [player, library, settings],
      onTap: (index) => context.read<PageProvider>().toPage(index),
    );

    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: context.watch<PageProvider>().currentPage,
    );
  }
}
