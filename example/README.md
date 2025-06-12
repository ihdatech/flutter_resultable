# Example: flutter_resultable

This is a minimal example showing how to use the `flutter_resultable` package.

## ✨ Example

```dart
import 'dart:developer' show log;
import 'dart:math';

import 'package:flutter_resultable/flutter_resultable.dart';

Future<void> main() async {
  final result = await _fetchUser();

  result.fold(
    (error) => log("Failure: $error"),
    (user) => log("Success: Hello, ${user.name}"),
  );
}

class User {
  final String name;
  User(this.name);
}

Future<Result<String, User>> _fetchUser() async {
  await Future.delayed(Duration(seconds: 1));

  final isSuccess = Random().nextBool();
  if (isSuccess) {
    return Result.success(User("Ihda Mukhoyar"));
  } else {
    return Result.failure("Network error: connection timeout");
  }
}
````

## 🚀 Run the example

To run:

```bash
dart run example/main.dart
```

> This works in both Dart and Flutter projects.

---

## 📦 Learn more

* [`flutter_resultable` on pub.dev](https://pub.dev/packages/flutter_resultable)

```