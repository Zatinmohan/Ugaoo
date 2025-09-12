enum EnvironmentType {
  dev('Development'),
  prod('Production'),
  stg('Staging');

  const EnvironmentType(this.label);

  // Human-friendly display label. Use the enum's built-in `.name`
  // for the identifier (dev/prod/stg).
  final String label;
}
