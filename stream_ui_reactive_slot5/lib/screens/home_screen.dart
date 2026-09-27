import 'package:flutter/material.dart';

import '../services/stream_service.dart';

class HomeScreen extends StatelessWidget {
  final StreamService streamService = StreamService();

  HomeScreen({super.key}) {
    // Bắt đầu phát dữ liệu
    streamService.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Counter Stream'),
      ),

      body: Center(
        child: StreamBuilder<int>(
          // Stream mà StreamBuilder sẽ lắng nghe
          stream: streamService.stream,

          builder: (context, snapshot) {
            // In ra console để quan sát UI rebuild
            print('UI rebuild: ${snapshot.data}');

            // Trạng thái đang chờ dữ liệu
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // Trạng thái lỗi
            if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
              );
            }

            // Chưa có dữ liệu
            if (!snapshot.hasData) {
              return const Text('No data');
            }

            // Có dữ liệu
            return Text(
              'Counter: ${snapshot.data}',
              style: const TextStyle(
                fontSize: 32,
              ),
            );
          },
        ),
      ),
    );
  }
}