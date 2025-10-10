import 'package:flutter/material.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/raw_text_field.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/types/root.dart';

/// Mixin for the root text field
mixin RootMixin on Root {
  /// Builds the text field
  Widget buildTextField(BuildContext context) {
    return RawTextField(
      controller: config.controller,
      focusNode: config.focusNode,
      validator: config.validator,
      onSaved: config.onSaved,
      keyboardType: config.keyboardType,
      obscureText: config.obscureText,
      style: config.style,
      readOnly: config.readOnly,
      autoFocus: config.autoFocus,
      autoCorrect: config.autoCorrect,
      selectAllOnFocus: config.selectAllOnFocus,
      showCursor: config.showCursor,
      maxLengthEnforcement: config.maxLengthEnforcement,
      maxLength: config.maxLength,
      minLines: config.minLines,
      maxLines: config.maxLines,
      expands: config.expands,
      isEnabled: config.isEnabled,
      onChanged: config.onChanged,
      onEditingComplete: config.onEditingComplete,
      onFieldSubmitted: config.onFieldSubmitted,
      onTap: config.onTap,
      onTapOutside: config.onTapOutside,
      inputFormatters: config.inputFormatters,
      textCapitalization: config.textCapitalization,
      textInputAction: config.textInputAction,
      textDirection: config.textDirection,
      textAlign: config.textAlign,
      textAlignVertical: config.textAlignVertical,
      hintText: config.hintText,
      helperText: config.helperText,
      initialValue: config.initialValue,
      label: config.label,
      errorText: config.errorText,
      autovalidateMode: config.autovalidateMode,
      prefix: config.prefix,
      suffix: config.suffix,
      prefixIcon: config.prefixIcon,
      suffixIcon: config.suffixIcon,
      alignLabelWithHint: config.alignLabelWithHint,
    );
  }
}
