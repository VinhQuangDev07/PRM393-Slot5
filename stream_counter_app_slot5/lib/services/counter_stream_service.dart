import 'dart:async';

class CounterStreamService {
  final StreamController<int> _controller = StreamController<int>(); // biến stream

  Stream<int> get counterStream => _controller.stream;// biến gửi dữ liệu cho UI

  int _count = 0; // biến ban đầu

  Timer? _timer;// ? là biến có thể null

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) { //periodic thực hiện code lặp lại theo khoản thời gian 1s.
      _count++; // biến điếm tăng lên
      _controller.add(_count);// dữ liệu được đưa vào stream.
    });
  }

  void dispose() {
    _timer?.cancel();// dừng thời gian
    _controller.close();// đóng stream
  }
}
