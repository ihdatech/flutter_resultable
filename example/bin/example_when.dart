import 'dart:developer';

import 'package:flutter_resultable/flutter_resultable.dart';

/// A simple Dart CLI example demonstrating how to use the `Result` type
/// from the `flutter_resultable` package to handle operations that may succeed or fail.
///
/// In this example, the `divide` function performs integer division and returns
/// a `Result` that encapsulates either a successful quotient or a failure message.
///
/// The `Result` type provides a safe and expressive way to handle errors without throwing exceptions,
/// using sealed classes with `Success` and `Failure` states.
///
/// Example usage:
/// ```dart
/// final result = divide(10, 2); // Success case
/// final result = divide(10, 0); // Failure case (division by zero)
/// ```
///
/// Handling the result:
/// - Use `.when` to pattern match on success or failure and respond accordingly.
/// - The example logs the outcome using Dart's `log` function.
///
/// This approach encourages functional-style error handling that improves code readability
/// and safety by avoiding nulls and exceptions.
///
/// Author: Ihda Mukhoyar
void main() {
  final result = divide(10, 2); // Try changing to divide(10, 0) to see Failure

  // Handle result using `.when` to react based on success or failure
  result.when(
    success: (value) => log("Success! Result is $value"),
    failure: (error) => log("Failure: $error"),
  );
}

/// Divides two integers [a] by [b] and returns a [Result] indicating success or failure.
///
/// Returns:
/// - `Result.success(int)` if division is valid,
/// - `Result.failure(String)` if division by zero is attempted.
///
/// This encapsulates the operation's outcome safely without exceptions.
Result<String, int> divide(int a, int b) {
  if (b == 0) return Result.failure("Cannot divide by zero");
  return Result.success(a ~/ b);
}
