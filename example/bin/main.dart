import 'package:flutter_resultable/flutter_resultable.dart';

/// A simple Dart CLI example using `Result` to handle division logic.
void main() {
  final result = divide(10, 2); // Try changing to divide(10, 0) to see Failure

  // Handle result using `.when`
  result.when(
    success: (value) => print("Success! Result is $value"),
    failure: (error) => print("Failure: $error"),
  );
}

/// Returns a `Result` type representing either success or failure.
Result<String, int> divide(int a, int b) {
  if (b == 0) return Result.failure("Cannot divide by zero");
  return Result.success(a ~/ b);
}
