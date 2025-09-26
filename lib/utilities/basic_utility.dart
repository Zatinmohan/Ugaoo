/// [EnumX] is an extension on [Iterable<T>] that provides a method to
/// get an enum by name
extension EnumX<T extends Enum> on Iterable<T> {
  /// This returns the enum by name or null if not found
  ///
  /// [name] is the name of the enum
  ///
  /// Returns the enum or null if not found
  T? byNameOrNull(String name) {
    for (final val in this) {
      if (val.name.toLowerCase() == name.toLowerCase()) {
        return val;
      }
    }
    return null;
  }
}

/// [ListX] is an extension on [List<T>] that provides a method to
/// get the first element that matches the predicate or null if not found
extension ListX<T> on List<T> {
  /// This returns the first element that matches the predicate or null
  /// if not found.
  /// [test] is the predicate to match the element
  ///
  /// Returns the element or null if not found
  T? firstWhereOrNull(bool Function(T) test) {
    for (final val in this) {
      if (test(val)) {
        return val;
      }
    }
    return null;
  }
}
