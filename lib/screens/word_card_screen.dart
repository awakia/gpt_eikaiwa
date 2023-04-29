import 'package:flutter/material.dart';

class WordCardScreen extends StatelessWidget {
  const WordCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('単語カード'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the number of cards
        itemBuilder: (context, index) {
          return const Card(
            child: ListTile(
              title: Text('英単語'), // Replace with real word data
              subtitle: Text('意味'), // Replace with real meaning data
            ),
          );
        },
      ),
    );
  }
}
