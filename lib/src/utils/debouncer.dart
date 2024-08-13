import 'dart:async';

class Debouncer {
  Timer? _timer;

  void run(void Function() callback) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 800), callback);
  }
}
