import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 80,
            child: TextFormField(
              initialValue: '80',
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              showCursor: false,
              style: const TextStyle(fontSize: 30),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.remove),
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
            )
          ],
        )
      ],
    );
  }
}
