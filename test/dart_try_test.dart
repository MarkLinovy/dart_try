import 'package:dart_try/dart_try.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('should return else value for error', () {
      final res = Try.of(() => syncFuncThatThrowsError()).orElseGet('else');
      expect(res, equals('else'));
    });

    test('should throw exception on failure', () {
      expect(() => Try.of(() => syncFuncThatThrowsError()).get(), throwsException);
    });

    test('should run else function on failure', () {
      final res = Try.of(() => syncFuncThatThrowsError()).orElse(() => 'else');
      expect(res, equals('else'));
    });

    test('should run else function on failure', () {
      final res = Try.of(() => 'success').get();
      expect(res, equals('success'));
    });

  });

  group('A group of tests', () {
    test('should return else value for error', () {
      final res = Try.of(() => asyncFuncThatThrowsError()).orElseGet('else');
      expect(res, equals('else'));
    });

    test('should return else value for error', () async {
      final res = await Try.of(() => Future.value('right')).orElseGet('else');
      expect(res, equals('right'));
    });

    test('should return else value for error', () async {
      final res = await Try.of(() => asyncFuncThatThrowsError()).orElse(() => Future.value('hi'));
      expect(res, equals('hi'));
    });
  });
}
Future<String> asyncFuncThatThrowsError() {
  throw Error();
}

String syncFuncThatThrowsError() {
  throw Error();
}
