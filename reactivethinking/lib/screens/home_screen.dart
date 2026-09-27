import 'package:flutter/material.dart';

import '../services/counter_stream_service.dart';

class HomeScreen extends StatelessWidget {
  final CounterStreamService service;

  HomeScreen(this.service);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive Counter'),
      ),

      body: Center(
        child: StreamBuilder<int>(
          stream: service.counterStream,

          builder: (context, snapshot) {
            print('UI rebuild');

            if (!snapshot.hasData) {
              return const Text(
                'Waiting...',
                style: TextStyle(fontSize: 30),
              );
            }

            return Text(
              snapshot.data.toString(),
              style: const TextStyle(
                fontSize: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}