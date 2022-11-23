import 'dart:async';


class Try <T> {
  final FutureOr<T> Function() _functionToExecute;

  Try._private({required FutureOr<T> Function() f}): _functionToExecute = f;

  factory Try.of(FutureOr<T> Function() f) {
    return Try._private(f: f);
  }

  /// execute function and get value
  FutureOr<T> get() {
    try {
      return _functionToExecute();
    } catch(e) {
      throw Exception();
    }
  }

  FutureOr<T> orElseGet(T t) {
    try {
      return _functionToExecute();
    } catch(e) {
      return t;
    }
  }

  FutureOr<T> orElse(FutureOr<T> Function() tF) {
    try {
      return _functionToExecute();
    } catch(e) {
      return tF();
    }
  }
}
