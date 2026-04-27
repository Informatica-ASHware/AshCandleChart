# PR Justification: Dependency Update

## meta: ^1.16.0
The package `kchart_flutter` requires `meta: ^1.16.0`.
However, `kchart_riverpod` was pinned to `meta: 1.15.0`.
In a Pub Workspace environment, this causes a version conflict that prevents `dart pub get` and `melos bootstrap` from succeeding.

To resolve this and maintain workspace integrity, `kchart_riverpod/pubspec.yaml` has been updated to use `meta: ^1.16.0`, which is compatible with both packages and the overall workspace configuration in the root `pubspec.yaml`.
