import 'package:flutter/material.dart';

/// [TypographicSemantics] is a class that represents the font style semantics.
class TypographicSemantics {
  /// Constructor of [TypographicSemantics] that requires:
  /// - [display] is the display style
  /// - [headline] is the headline style
  /// - [title] is the title style
  /// - [bodyLarge] is the body large style
  /// - [bodyMedium] is the body medium style
  /// - [label] is the label style
  /// - [caption] is the caption style
  const TypographicSemantics({
    required this.display,
    required this.headline,
    required this.title,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.label,
    required this.caption,
  });

  /// The largest, most impactful text style, for hero sections or marketing.
  final TextStyle display;

  /// The style for standard page titles and major headings.
  final TextStyle headline;

  /// The style for subheadings and medium-emphasis titles within sections.
  final TextStyle title;

  /// The default style for all primary body text, like product descriptions.
  final TextStyle bodyLarge;

  /// The style for secondary or less important paragraphs of text.
  final TextStyle bodyMedium;

  /// The style for UI control elements like button text, input labels,
  /// and tabs.
  final TextStyle label;

  /// The style for the smallest text, used for metadata, notes, or captions.
  final TextStyle caption;
}
