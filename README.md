[![pub package](https://img.shields.io/pub/v/dart_try.svg?label=dart_try&color=blue)](https://pub.dartlang.org/packages/dart_try)

```qute
The Try control gives us the ability write safe code without focusing on try-catch blocks in the presence of exceptions.
```

# Before

```dart
void main() {
  String? randomWord;

  try {
    randomWord = getRandomWordFromServer();
  } catch (e) {
    randomWord = 'fallback';
  }
}
```

# With Try
```dart
void main() {
  final randomWord = Try.of(() => getRandomWordFromServer()).orElseGet('fallback');
}
```


## Immutability

With try catch we will have to split initialization and declaration.
This forces us to make variables mutable, although they might only get assigned a value once.

## Null Safety

If we use try catch control flow we might have a different Variable type. Below we declare randomWord
to be nullable. Now `getRandomWordFromServer` might return `String?` as well. We lose our strict null safety.

## It's easier to read

# Features

- Wrap Code that might throw an error with ```Try.of(() => doSomething())```
- Get result immediately if sure there is no error
- Return alternative the event of an error
  - tryable.orElse(() => elseFunction());
  - tryable.orElseGet('value')


