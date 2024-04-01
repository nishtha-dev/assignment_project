import 'dart:async';

import 'package:flutter/material.dart';

class Debounce {
  final int milliseconds;
  Timer? _timer;

  Debounce({required this.milliseconds});

  void run({required VoidCallback call}) {
    if (_timer != null) {
      _timer?.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), () => call());
  }

  void cancel() {
    _timer?.cancel();
  }
}
