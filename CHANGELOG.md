## 0.0.3

### Changed
* Updated `freezed_annotation` to `^3.0.0`
* Updated `freezed` to `^3.0.6`
* Updated `flutter_lints` to `^6.0.0`
* Raised minimum SDK constraint to `^3.8.0`

---

## 0.0.2

### 🛠 Improvements

* 🧠 Enhanced DartDoc documentation for `Result` and its extensions
  * Clearer examples and use case descriptions
  * Fixed typos and improved structure for readability
* ✅ More consistent formatting across all documentation blocks
* ♻️ Internally restructured doc comments to follow Dart/Flutter standards

---

## 0.0.1

### 🚀 Initial Release

This is the first release of the package.

### ✨ Features

* ✅ `Result<F, S>` sealed class using `freezed`
  * `Result.failure(F)` and `Result.success(S)`
* ✅ `fold()` extension for functional handling of `Result`
  * Simplifies branching logic for success and failure
* ✅ Utility extensions:
  * `isSuccess`, `isFailure`
  * `successOrNull`, `failureOrNull`
  * `getOrElse(fallback)`
* 📚 Complete DartDoc documentation and usage examples
* ✅ Designed for use in clean architecture, functional error handling, and repository patterns

### 📦 Intended Use Cases

* Wrapping results of async or fallible operations
* Alternative to `try-catch` for service and repository layers
* Clean and testable error handling patterns
