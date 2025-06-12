import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// A sealed class representing the result of an operation, which can either be a
/// [Failure] or a [Success].
///
/// This pattern is inspired by functional programming concepts like `Either` or
/// `Result`, providing a safe and expressive way to handle operations that may fail.
///
/// ---
///
/// ### ✅ Example using `when`:
/// ```dart
/// Result<String, int> result = someOperation();
///
/// result.when(
///   failure: (error) => print("Failure: $error"),
///   success: (value) => print("Success: $value"),
/// );
/// ```
///
/// ### ✅ Example using `fold` (via extension):
/// ```dart
/// Result<String, int> result = someOperation();
///
/// result.fold(
///   (error) => print("Failure: $error"),
///   (value) => print("Success: $value"),
/// );
/// ```
///
/// ---
///
/// You can also use `map`, `maybeWhen`, `whenOrNull`, or `fold` (via extension)
/// to handle different outcomes with greater flexibility.
///
/// This class is typically used in:
/// - Use cases (domain logic)
/// - Repositories or services that might fail (e.g., network or I/O)
/// - Validation, parsing, or any logic returning success/failure
@freezed
sealed class Result<F, S> with _$Result<F, S> {
  /// Represents a failure outcome containing an error of type [F].
  const factory Result.failure(F failure) = Failure<F, S>;

  /// Represents a success outcome containing a result of type [S].
  const factory Result.success(S success) = Success<F, S>;
}
