import 'package:flutter/material.dart';
import 'package:flutter_resultable/flutter_resultable.dart';

void main() {
  runApp(const ResultExampleApp());
}

/// A simple Flutter app demonstrating usage of `Result`
/// from the `flutter_resultable` package.
class ResultExampleApp extends StatelessWidget {
  const ResultExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_resultable Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ResultDemoScreen(),
    );
  }
}

class ResultDemoScreen extends StatefulWidget {
  const ResultDemoScreen({super.key});

  @override
  State<ResultDemoScreen> createState() => _ResultDemoScreenState();
}

class _ResultDemoScreenState extends State<ResultDemoScreen> {
  // Controllers to input two numbers
  final TextEditingController _controllerA = TextEditingController(text: '10');
  final TextEditingController _controllerB = TextEditingController(text: '2');

  // Holds the result of the division operation
  Result<String, int>? _result;

  /// Example function that divides `a` by `b`.
  /// Returns a `Failure` if `b` is zero,
  /// otherwise returns a `Success` with the quotient.
  Result<String, int> divide(int a, int b) {
    if (b == 0) return Result.failure("Cannot divide by zero");
    return Result.success(a ~/ b);
  }

  /// Reads input, performs division, and updates the UI with the result.
  void _calculate() {
    final a = int.tryParse(_controllerA.text);
    final b = int.tryParse(_controllerB.text);

    if (a == null || b == null) {
      setState(() {
        _result = Result.failure("Please enter valid integers");
      });
      return;
    }

    final result = divide(a, b);

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("flutter_resultable Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Input for number A
            TextField(
              controller: _controllerA,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Input number A",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Input for number B
            TextField(
              controller: _controllerB,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Input number B",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Button to perform the division
            ElevatedButton(
              onPressed: _calculate,
              child: const Text("Calculate A ÷ B"),
            ),

            const SizedBox(height: 24),

            // Display the result based on success or failure
            if (_result != null)
              _result!.when(
                success: (value) => Text(
                  "Success! Result is $value",
                  style: const TextStyle(fontSize: 18, color: Colors.green),
                ),
                failure: (error) => Text(
                  "Failure: $error",
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
