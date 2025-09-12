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
