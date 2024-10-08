import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_use_basic/flutter_use.dart';

/// Flutter hook that delays invoking a function until after wait milliseconds
/// have elapsed since the last time the debounced function was invoked.
/// The third argument is the array of values that the debounce depends on,
/// in the same manner as useEffect. The debounce timeout will start when one
/// of the values changes.
void useDebounce(VoidCallback fn, Duration delay, [List<Object?>? keys]) {
  final timeout = useTimeoutFn(fn, delay);
  useEffect(() => timeout.reset, keys);
}

void Function(T)? useDebouncedTimer<T>(void Function(T) callback, Duration delay) {
  final timer = useRef<Timer?>(null);

  return (T value) {
    timer.value?.cancel();
    timer.value = Timer(delay, () => callback(value));
  };
}
