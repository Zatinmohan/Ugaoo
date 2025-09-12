extension EnumX<T extends Enum> on Iterable<T> {
  T? byNameOrNull(String name) {
    for (final val in this) {
      if (val.name.toLowerCase() == name.toLowerCase()) {
        return val;
      }
    }
    return null;
  }
}
