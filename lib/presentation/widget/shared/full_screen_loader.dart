import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    const messages = <String>[
      'Loading movies',
      'Buying popcorns',
      'Loading Popular Movies',
      'Loading Most Popular movies',
      'So sorry, just :c wait a little bit',
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (steps) {
      return messages[steps];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Wait please"),
          const SizedBox(height: 20),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 20),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text("Waiting...");
              }
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
