// ignore_for_file: document_ignores

part of '../text_field/types/root.dart';

/// Mixin for the root text field
mixin RootMixin on Root {
  /// Builds the text field
  Widget buildTextField(BuildContext context) {
    assert(
      config.controller == null ||
          config.controller is DefaultRootFieldController,
      'RootMixin only supports DefaultRootFieldController. '
      // ignore: lines_longer_than_80_chars
      'If you are using a custom controller, please ensure it extends DefaultRootFieldController.',
    );
    return RawTextField(
      controller: config.controller != null
          ? (config.controller! as DefaultRootFieldController).controller
          : null,
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
      onEditingComplete: () => config.onEditingComplete?.call(null),
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
