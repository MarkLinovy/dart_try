[![pub package](https://img.shields.io/pub/v/dart_try.svg?label=dart_try&color=blue)](https://pub.dartlang.org/packages/dart_try)

```qute
The Try control gives us the ability write safe code without focusing on try-catch blocks in the presence of exceptions.
```


## Immutability

With try catch we will have to split initialization and declaration.
Forcing us to make variables mutable that only get assigned a value once.

## Type

If we use try catch control flow we might have a different Variable type. Below we declare randomWord
to be nullable. Now getRandomWordFromServer might return String? aswell. We lose our strict null safety.

## It's easier to read

## It scales well

What if you had 2 Function calls which you want to interpret in case of an error?

Lets imagine 2 Functions 'randomWordIsDogOnFailure' and 'randomWordIsCatOnFailure'.
They both throw different kind of errors.
So we have 2 ways of handling their failing specifically.

### Version 1:

```dart
void main() {
  String? randomWord;

  try {
    randomWord = randomWordIsCatOnFailure();
    randomWord += randomWordIsDogOnFailure();
  } on CatException catch (e) {
    randomWord = 'cat';
  } on DogException catch (e) {
    randomWord = 'dog';
  }
}
```

```dart
void main() {
  final randomWord = Try.of(() => randomWordIsCatOnFailure()).orElseGet('cat');
}
```

## It is lightweight

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

```dart
void main() {
  final randomWord = Try.of(() => getRandomWordFromServer()).orElseGet('fallback');
}
```

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart

const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
