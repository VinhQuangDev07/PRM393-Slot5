import 'dart:async';

class StreamService {
  // Controller dùng để phát dữ liệu vào Stream
  final StreamController<int> _controller =
      StreamController<int>();

  // Biến lưu giá trị counter hiện tại
  int _counter = 0;

  // Cho bên ngoài lấy Stream để lắng nghe
  Stream<int> get stream => _controller.stream;

  // Bắt đầu phát dữ liệu
  void start() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _counter++;

        // Đưa dữ liệu mới vào Stream
        _controller.add(_counter);
      },
    );
  }

  // Đóng Stream khi không còn sử dụng
  void dispose() {
    _controller.close();
  }
}