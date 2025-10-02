/// [RadiusSemantic] is a class that represents the radius semantic.
class RadiusSemantic {
  /// Constructor of [RadiusSemantic] that requires:
  /// - [small] is the small token
  /// - [medium] is the medium token
  /// - [large] is the large token
  const RadiusSemantic({
    required this.small,
    required this.medium,
    required this.large,
  });

  /// Small Radius Semantic
  final double small;

  /// Medium Radius Semantic
  final double medium;

  /// Large Radius Semantic
  final double large;
}
