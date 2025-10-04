/// [PaddingSemantic] is a class that represents the padding semantic.
class PaddingSemantic {
  /// Constructor of [PaddingSemantic] that requires:
  /// - [condensed] is the condensed token
  /// - [compact] is the compact token
  /// - [regular] is the regular token
  /// - [relaxed] is the relaxed token
  /// - [expanded] is the expanded token
  const PaddingSemantic({
    required this.condensed,
    required this.compact,
    required this.regular,
    required this.relaxed,
    required this.expanded,
  });

  /// Condensed token
  final double condensed;

  /// Compact token
  final double compact;

  /// Regular token
  final double regular;

  /// Relaxed token
  final double relaxed;

  /// Expanded token
  final double expanded;
}
