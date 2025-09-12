/// [EnvironmentType] is an enum that represents
/// the environment type
enum EnvironmentType {
  /// Development environment
  dev('Development'),

  /// Production environment
  prod('Production'),

  /// Staging environment
  stg('Staging');

  const EnvironmentType(this.label);

  /// Human-friendly display label. Use the enum's built-in `.name`
  /// for the identifier (dev/prod/stg).
  final String label;
}
