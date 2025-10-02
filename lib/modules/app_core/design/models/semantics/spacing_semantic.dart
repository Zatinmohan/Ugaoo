/// [SpacingSemantic] is a class that represents the spacing semantic.
class SpacingSemantic {
  /// Constructor of [SpacingSemantic] that requires:
  /// - [intimate] is the intimate token
  /// - [personal] is the personal token
  /// - [social] is the social token
  /// - [public] is the public token
  /// - [global] is the global token
  const SpacingSemantic({
    required this.intimate,
    required this.personal,
    required this.social,
    required this.public,
    required this.global,
  });

  /// Intimate token
  final double intimate;

  /// Personal token
  final double personal;

  /// Social token
  final double social;

  /// Public token
  final double public;

  /// Global token
  final double global;
}
