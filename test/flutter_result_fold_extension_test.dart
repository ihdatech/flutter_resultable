import 'package:flutter_resultable/flutter_resultable.dart';
import 'package:test/test.dart';

void main() {
  group('ResultFoldExtension', () {
    test('fold executes onFailure when Result is Failure', () {
      final result = const Result<String, int>.failure('error');

      final output = result.fold(
        (failure) => 'Failed with $failure',
        (success) => 'Succeeded with $success',
      );

      expect(output, 'Failed with error');
    });

    test('fold executes onSuccess when Result is Success', () {
      final result = const Result<String, int>.success(42);

      final output = result.fold(
        (failure) => 'Failed with $failure',
        (success) => 'Succeeded with $success',
      );

      expect(output, 'Succeeded with 42');
    });
  });
}
