import 'package:flutter_resultable/src/result.dart';

/// Extension that provides convenient getters and utility methods
/// for working with [Result] instances.
extension ResultGetters<F, S> on Result<F, S> {
  /// Returns `true` if this [Result] is a success variant.
  bool get isSuccess => this is Success<F, S>;

  /// Returns `true` if this [Result] is a failure variant.
  bool get isFailure => this is Failure<F, S>;

  /// Returns the success value if present, otherwise `null`.
  ///
  /// Useful when you want to safely access the success value
  /// without handling the failure case.
  S? get successOrNull => whenOrNull(success: (s) => s);

  /// Returns the failure value if present, otherwise `null`.
  ///
  /// Useful when you want to safely access the failure value
  /// without handling the success case.
  F? get failureOrNull => whenOrNull(failure: (f) => f);

  /// Returns the success value if present, otherwise computes
  /// a fallback value using the given [fallback] function
  /// based on the failure value.
  ///
  /// This is useful to provide a default or alternative value
  /// in case of failure.
  ///
  /// Example:
  /// ```dart
  /// final result = divide(10, 0);
  /// final value = result.getOrElse((failure) => -1);
  /// ```
  S getOrElse(S Function(F failure) fallback) {
    return when(success: (s) => s, failure: (f) => fallback(f));
  }
}
