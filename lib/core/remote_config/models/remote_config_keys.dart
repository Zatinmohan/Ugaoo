/// [RemoteConfigKey] is a class that represents the remote configuration keys.
enum RemoteConfigKey {
  /// The key string associated with the remote configuration value.
  testKey('test');

  /// Constructor of [RemoteConfigKey] that requires:
  /// - [key] is the key string associated with the remote configuration value.
  const RemoteConfigKey(
    this.key,
  );

  /// The key string associated with the remote configuration value.
  final String key;
}
