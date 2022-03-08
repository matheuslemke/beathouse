import 'package:flutter/material.dart';

class AddSong extends StatelessWidget {
  const AddSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add song'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // saveSong();
          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
      body: Form(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Beat'),
            keyboardType: const TextInputType.numberWithOptions(
                decimal: false, signed: false),
          )
        ],
      )),
    );
  }
}
