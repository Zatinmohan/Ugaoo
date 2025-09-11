enum EnvironmentType {
  dev('Development'),
  prod('Production'),
  stg('Staging');

  const EnvironmentType(this.name);

  final String name;
}
