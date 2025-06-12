import 'package:flutter_resultable/src/result.dart';

/// Extension that provides convenient utility getters and methods
/// for working with [Result] instances in a more expressive way.
extension ResultGetters<F, S> on Result<F, S> {
  /// Returns `true` if this [Result] is a [Success] variant.
  bool get isSuccess => this is Success<F, S>;

  /// Returns `true` if this [Result] is a [Failure] variant.
  bool get isFailure => this is Failure<F, S>;

  /// Returns the success value if present, otherwise `null`.
  ///
  /// Useful for safely accessing the success value
  /// without needing to handle the failure explicitly.
  S? get successOrNull => whenOrNull(success: (s) => s);

  /// Returns the failure value if present, otherwise `null`.
  ///
  /// Useful for safely accessing the failure value
  /// without needing to handle the success explicitly.
  F? get failureOrNull => whenOrNull(failure: (f) => f);

  /// Returns the success value if present, otherwise returns the result
  /// of calling [fallback] with the failure value.
  ///
  /// This is useful for providing a default or fallback value
  /// in case of failure.
  ///
  /// Example:
  /// ```dart
  /// final result = divide(10, 0);
  /// final value = result.getOrElse((failure) => -1);
  /// ```
  S getOrElse(S Function(F failure) fallback) {
    return when(
      success: (s) => s,
      failure: (f) => fallback(f),
    );
  }
}

/// Extension that adds a `fold` method to [Result], allowing functional-style
/// branching logic for both success and failure outcomes.
///
/// This is functionally equivalent to `when`, but more concise and
/// commonly used in functional programming styles.
///
/// Example:
/// ```dart
/// result.fold(
///   (failure) => print("Failure: $failure"),
///   (success) => print("Success: $success"),
/// );
/// ```
extension ResultFoldExtension<F, S> on Result<F, S> {
  /// Applies one of the provided functions based on the [Result] type.
  ///
  /// - If the result is a [Failure], executes [onFailure] with the failure value.
  /// - If the result is a [Success], executes [onSuccess] with the success value.
  T fold<T>(
    T Function(F failure) onFailure,
    T Function(S success) onSuccess,
  ) {
    return when(
      failure: onFailure,
      success: onSuccess,
    );
  }
}