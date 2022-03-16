import 'package:beathouse/model/song.dart';
import 'package:beathouse/providers/adding_song_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddSong extends StatelessWidget {
  final Song? song;

  const AddSong({Key? key, this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddingSongProvider(song),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title:
              song != null ? const Text('Edit song') : const Text('Add song'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<AddingSongProvider>().saveSong();
            Navigator.pop(context);
            // TODO: refetch data
          },
          child: const Icon(Icons.save),
        ),
        body: Form(
          child: Column(
            children: [
              TextFormField(
                controller: context.read<AddingSongProvider>().nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: context.read<AddingSongProvider>().rateController,
                decoration: const InputDecoration(labelText: 'Rate'),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
              )
            ],
          ),
        ),
      ),
    );
  }
}
