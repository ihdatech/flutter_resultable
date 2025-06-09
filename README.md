# flutter_resultable

A lightweight, expressive `Result` type for Flutter and Dart to model success and failure outcomes without exceptions, inspired by functional programming patterns like `Either`.

![Pub Version](https://img.shields.io/pub/v/flutter_resultable.svg)
![Build Status](https://img.shields.io/github/workflow/status/your-username/flutter_resultable/Dart%20CI)
![License](https://img.shields.io/github/license/your-username/flutter_resultable)

---

## ✨ Features

- ✅ `Result.success` and `Result.failure` to represent outcomes cleanly.
- 🔁 Pattern matching via `when`, `map`, and `maybeWhen` (thanks to `freezed`).
- ⚡ Strongly typed error and success handling.
- 💡 Easily testable and composable.
- 🪶 Minimal, clean API.

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_resultable: ^1.0.0
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

### Using `maybeWhen`

```dart
result.maybeWhen(
  success: (value) => print("Success with $value"),
  orElse: () => print("Something went wrong"),
);
```

---

## 📘 API

```dart
sealed class Result<F, S> {
  const factory Result.failure(F failure) = Failure<F, S>;
  const factory Result.success(S success) = Success<F, S>;
}
```

* `Result.failure(F)` → represents a failure result.
* `Result.success(S)` → represents a successful result.

---

## 🛠️ Generated Code

This package uses [freezed](https://pub.dev/packages/freezed). To generate code locally (for contributors):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📄 License

MIT License

---

## 💰 Support

If you find this project helpful, consider [sponsoring me on GitHub](https://github.com/sponsors/ihdatech) 💖

---

## 🙌 Contributing

Contributions, ideas, and pull requests are welcome. Let’s make `flutter_resultable` better together!

```


