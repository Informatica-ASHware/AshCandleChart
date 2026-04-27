# PR Justification: Dependency Update

## meta: ^1.15.0
The package `kchart_flutter` requires a modern version of `meta`.
However, different packages in the workspace had conflicting requirements or were pinned to versions like `1.15.0` (as required by some Flutter SDK versions of `flutter_test`).
In a Pub Workspace environment, this causes version conflicts that prevent `dart pub get` and `melos bootstrap` from succeeding.

To resolve this and maintain workspace integrity, all `pubspec.yaml` files (root and packages) have been updated to use a compatible range `meta: ^1.15.0`. This allows the workspace to build while satisfying the requirements of both the Flutter SDK and the individual packages.
