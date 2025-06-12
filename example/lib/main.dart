import 'package:flutter/material.dart';
import 'package:flutter_resultable/flutter_resultable.dart';

/// A simple user entity.
class User {
  final String name;
  User(this.name);
}

/// Simulates a repository that fetches a [User] from a remote or local source.
///
/// This method returns a [Result] that contains:
/// - [Result.success] if the operation is successful.
/// - [Result.failure] if the operation fails (simulated with a flag or empty input).
class UserRepository {
  Future<Result<String, User>> fetchUser({
    required String name,
    required bool fail,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (fail) return const Result.failure("This is a triggered failure");

    if (name.isNotEmpty) {
      return Result.success(User(name));
    } else {
      return Result.failure("Input cannot be empty");
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// A UI page that demonstrates how to use [Result] to handle asynchronous
/// operations that may fail or succeed.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final UserRepository _repository = UserRepository();

  /// Holds the current [Result] of the latest user-fetch operation.
  Result<String, User> _isResult = Failure('Failure: is Empty');

  /// Displays a message based on the result.
  String _message = '';

  /// Shows a loading indicator during fetch.
  bool _loading = false;

  /// Handles the fetch operation using [Result.fold] to determine
  /// success or failure outcome.
  ///
  /// 💡 This is where [flutter_resultable] shines — you avoid nested
  /// `try-catch` or null checks by using [fold] and [Result] variants.
  Future<void> _fetchUser({required String name, required bool fail}) async {
    setState(() {
      _loading = true;
      _message = '';
    });

    final result = await _repository.fetchUser(name: name, fail: fail);

    // Use `fold` to elegantly handle both success and failure branches.
    result.fold(
      (failure) => _message = '❌ Failure: $failure',
      (success) => _message = '✅ Success: Hello, ${success.name}',
    );

    setState(() {
      _isResult = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Stack(
          children: [
            Visibility(
              visible: !_loading,
              child: Column(
                children: [
                  // 👤 Input field for the user name
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Enter You'r Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // 🎯 Buttons to trigger success or failure
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _fetchUser(
                            name: _nameController.text.trim(),
                            fail: false,
                          ),
                          child: const Text('Trigger Success'),
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () => _fetchUser(
                            name: _nameController.text.trim(),
                            fail: true,
                          ),
                          child: const Text('Trigger Failure'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // 📝 Result message display
                  Text(
                    _message,
                    style: TextStyle(
                      fontSize: 18,
                      color: _isResult.isSuccess ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            // ⏳ Loading spinner when fetching
            Visibility(
              visible: _loading,
              child: const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
