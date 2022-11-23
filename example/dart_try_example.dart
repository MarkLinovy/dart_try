import 'package:dart_try/dart_try.dart';

void main() {
  // execute http call that can fail
  final test = Try.of(() => getSomething()).orElseGet('TEST');
}

Future<String> getSomething() {
  return Future.value('');
}
