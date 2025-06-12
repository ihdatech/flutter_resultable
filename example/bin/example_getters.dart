import 'dart:developer';

import 'package:flutter_resultable/flutter_resultable.dart';

Future<Result<String, int>> divideAsync(int a, int b) async {
  try {
    await Future.delayed(Duration(seconds: 1)); // simulate async

    if (b == 0) {
      // Manual check for division by zero
      return Result.failure("Cannot divide by zero");
    }

    final result = a ~/ b; // integer division
    return Result.success(result);
  } catch (e) {
    // Catch unexpected errors and wrap as failure
    return Result.failure("Unexpected error: $e");
  }
}

Future<void> main() async {
  final result = await divideAsync(10, 0);

  if (result.isSuccess) {
    log("Success! Result is ${result.successOrNull}");
  } else if (result.isFailure) {
    log("Failed with error: ${result.failureOrNull}");
  }

  // Or with fallback default value
  final value = result.getOrElse((failure) => -1);
  log("Result or fallback value: $value");
}
