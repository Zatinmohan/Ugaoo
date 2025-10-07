import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/components/text/raw_text.dart';
import 'package:ugaoo/modules/app_core/design/components/text/types/bud.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';

/// [BudMixin] is a mixin that provides the necessary methods
/// to build a [Bud] widget.
mixin BudMixin on Bud {
  /// This method resolves the style of the [Bud] widget.
  TextStyle resolveStyle(BuildContext context);

  /// This method builds the [Bud] widget.
  Widget buildText(BuildContext context) {
    final style = resolveStyle(context).copyWith(
      color: color ?? context.color.textPrimary,
      decoration: decoration,
    );

    return RawText(
      text: text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,
      textDirection: textDirection,
      isSelectable: isSelectable,
      semanticLabel: semanticLabel,
    );
  }
}
