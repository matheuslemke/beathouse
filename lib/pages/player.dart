import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: 'Input text',
          decoration: const InputDecoration(
            labelText: 'Label text',
            errorText: 'Error message',
            border: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.error,
            ),
          ),
        ),
      ],
    );
  }
}
