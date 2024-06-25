import 'dart:async';
import 'package:flutter/material.dart';

mixin Debounce {
  Timer? _debounce;

  void debounce(VoidCallback action,
      {Duration duration = const Duration(milliseconds: 500)}) {
    _debounce?.cancel();
    _debounce = Timer(duration, action);
  }

  void disposeDebounce() {
    _debounce?.cancel();
  }
}
