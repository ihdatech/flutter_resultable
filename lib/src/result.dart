import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// A sealed class representing the result of an operation, which can either
/// be a [Failure] or a [Success].
///
/// This is a common functional pattern (also known as `Either` or `Result` type),
/// designed to safely handle both success and failure scenarios in a unified way.
///
/// Example usage:
/// ```dart
/// Result<String, int> result = someOperation();
///
/// result.when(
///   failure: (error) => print("Error: $error"),
///   success: (value) => print("Success: $value"),
/// );
/// ```
///
/// You can also use `map`, `maybeWhen`, or `fold` (from extension methods) for more flexibility.
@freezed
sealed class Result<F, S> with _$Result<F, S> {
  /// Represents a failure outcome containing an error value of type [F].
  const factory Result.failure(F failure) = Failure<F, S>;

  /// Represents a success outcome containing a success value of type [S].
  const factory Result.success(S success) = Success<F, S>;
}
