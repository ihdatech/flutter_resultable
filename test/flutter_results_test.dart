import 'package:flutter_resultable/flutter_resultable.dart';
import 'package:test/test.dart';

void main() {
  group('Result', () {
    test('returns success when valid', () {
      final result = divide(10, 2);
      expect(result.isSuccess, isTrue);
      expect(
        result.when(success: (value) => value, failure: (_) => null),
        equals(5),
      );
    });

    test('returns failure on division by zero', () {
      final result = divide(10, 0);
      expect(result.isFailure, isTrue);
      expect(
        result.when(success: (_) => null, failure: (e) => e),
        equals('Cannot divide by zero'),
      );
    });

    test('maybeWhen fallback works', () {
      final result = divide(10, 0);
      final output = result.maybeWhen(
        success: (v) => 'OK',
        orElse: () => 'Fallback',
      );
      expect(output, equals('Fallback'));
    });

    test('map transforms result values', () {
      final result = divide(10, 2);
      final mapped = result.map(
        success: (success) => Result.success(success.success * 2),
        failure: (failure) => Result.failure('Err: ${failure.failure}'),
      );
      expect(mapped.isSuccess, isTrue);
      expect(mapped.successOrNull, equals(10));
    });

    test('getOrElse returns value or fallback', () {
      final success = divide(20, 2).getOrElse((_) => -1);
      final failure = divide(20, 0).getOrElse((_) => -1);
      expect(success, equals(10));
      expect(failure, equals(-1));
    });

    test('successOrNull / failureOrNull getters work', () {
      final success = divide(30, 3);
      final failure = divide(30, 0);

      expect(success.successOrNull, equals(10));
      expect(success.failureOrNull, isNull);

      expect(failure.failureOrNull, equals('Cannot divide by zero'));
      expect(failure.successOrNull, isNull);
    });
  });
}

Result<String, int> divide(int a, int b) {
  if (b == 0) return const Result.failure('Cannot divide by zero');
  return Result.success(a ~/ b);
}
