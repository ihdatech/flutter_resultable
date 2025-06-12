# flutter_resultable

A lightweight, expressive `Result` type for Flutter and Dart to model success and failure outcomes **without using exceptions**, inspired by functional programming patterns like `Either`.

![Pub Version](https://img.shields.io/pub/v/flutter_resultable)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/ihdatech/flutter_resultable/Dart%20CI)
![GitHub License](https://img.shields.io/github/license/ihdatech/flutter_resultable.svg)

---

## ✨ Features

- ✅ `Result.success(S)` and `Result.failure(F)` to represent outcomes cleanly.
- 🔁 Pattern matching via `when`, `map`, and `maybeWhen` (thanks to [`freezed`](https://pub.dev/packages/freezed)).
- ⚡ Strongly typed failure and success handling.
- 🧠 Utility extensions:
  - `isSuccess`, `isFailure`
  - `successOrNull`, `failureOrNull`
  - `getOrElse(fallback)`
  - `fold(onFailure, onSuccess)`
- 💡 Easily testable and composable.
- 🪶 Minimal, clean API.

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_resultable: ^0.0.2
````

Then run:

```bash
flutter pub get
```

---

## 🔧 Usage

### Define a result-returning function

```dart
import 'package:flutter_resultable/flutter_resultable.dart';

Result<String, int> divide(int a, int b) {
  if (b == 0) return Result.failure("Division by zero");
  return Result.success(a ~/ b);
}
```

### Handle with pattern matching

```dart
final result = divide(10, 2);

result.when(
  failure: (error) => print("Error: $error"),
  success: (value) => print("Result: $value"),
);
```

### Use `maybeWhen` for optional handling

```dart
result.maybeWhen(
  success: (value) => print("Success with $value"),
  orElse: () => print("Something went wrong"),
);
```

### Use `fold` for cleaner branching

```dart
result.fold(
  (error) => print("Error: $error"),
  (value) => print("Value: $value"),
);
```

### Use `getOrElse` to provide a fallback value

```dart
final value = result.getOrElse((error) => -1); // returns 5 or -1
```

### Check result state or access nullable values

```dart
if (result.isSuccess) {
  print(result.successOrNull);
} else {
  print(result.failureOrNull);
}
```

---

## 📘 API

```dart
sealed class Result<F, S> {
  const factory Result.failure(F failure) = Failure<F, S>;
  const factory Result.success(S success) = Success<F, S>;
}
```

### Utility Extensions

| Extension       | Description                                 |
| --------------- | ------------------------------------------- |
| `isSuccess`     | Returns `true` if the result is success     |
| `isFailure`     | Returns `true` if the result is failure     |
| `successOrNull` | Returns success value or `null`             |
| `failureOrNull` | Returns failure value or `null`             |
| `getOrElse`     | Fallback mechanism based on failure value   |
| `fold`          | Branching on both success and failure cases |

---

## 💰 Support

If you find this project helpful, consider [sponsoring me on GitHub](https://github.com/sponsors/ihdatech) 💖

---

## 🙌 Contributing

Contributions, ideas, and pull requests are welcome. Let’s make `flutter_resultable` better together!

---

## 🙏 Thanks

This package is powered by the amazing [`freezed`](https://pub.dev/packages/freezed) package.
Special thanks to [Remi Rousselet](https://github.com/rrousselGit) and contributors for their work.

Without `freezed`, clean and expressive sealed classes like `Result` wouldn't be this simple ✨

---

## 📄 License

MIT License

---

## 🔗 Useful Links

* [Flutter Documentation](https://flutter.dev/docs)
* [GitHub Repository](https://github.com/ihdatech/flutter_resultable)
* [Pub.dev Package Page](https://pub.dev/packages/flutter_resultable)
