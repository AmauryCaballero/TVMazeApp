import 'dart:async';

mixin Debounce {
  Timer? _debounce;

  Future<void> debounce(Future<void> Function() action,
      {Duration duration = const Duration(milliseconds: 500)}) async {
    _debounce?.cancel();
    Completer<void> completer = Completer<void>();
    _debounce = Timer(duration, () async {
      await action();
      completer.complete();
    });
    return completer.future;
  }

  void disposeDebounce() {
    _debounce?.cancel();
  }
}
