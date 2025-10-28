import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/model/root_field_controller.dart';

@immutable

/// [RootConfig] is the configuration for the root text field
class RootConfig {
  /// Creates a [RootConfig]
  const RootConfig({
    this.controller,
    this.focusNode,
    this.obscureText,
    this.readOnly,
    this.autoFocus,
    this.selectAllOnFocus,
    this.showCursor,
    this.maxLengthEnforcement,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.expands,
    this.isEnabled,
    this.autoCorrect,
    this.alignLabelWithHint,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.onTapOutside,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization,
    this.textInputAction,
    this.textDirection,
    this.autovalidateMode,
    this.textAlign,
    this.textAlignVertical,
    this.hintText,
    this.label,
    this.errorText,
    this.initialValue,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.onSaved,
    this.helperText,
    this.style,
    this.overrideSuffix = false,
    this.length,
    this.isLoading = false,
    this.semanticLabel,
  });

  /// Controls the editable text, selection, and composing region; when supplied
  /// it becomes the source of truth for
  /// the field’s value within `TextFormField`
  final RootFieldController? controller;

  /// Manages focus requests and traversal, integrating with `FocusScope`
  final FocusNode? focusNode;

  /// Whether to obscure the text (e.g., passwords), delegating to platform
  /// conventions for masked fields via the Material text input system
  final bool? obscureText;

  /// Makes the field non-editable while retaining visual presentation and
  /// selection behavior consistent with Material read-only inputs
  final bool? readOnly;

  /// Requests focus automatically when this widget is built, matching
  /// TextFormField autofocus semantics in Flutter
  final bool? autoFocus;

  // Selects all text when the field gains focus, enabling quick replacement
  /// workflows for short inputs like codes or identifiers
  final bool? selectAllOnFocus;

  /// Shows or hides the caret independent of focus, useful for custom
  /// selection/read-only
  final bool? showCursor;

  /// Controls how the platform enforces `maxLength` (e.g., truncation vs.
  /// length blocking) in cooperation with TextField’s editing pipeline
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Limits the number of characters the user can enter, with platform-specific
  /// enforcement behavior determined by `maxLengthEnforcement`
  final int? maxLength;

  /// Specifies the minimum number of lines the field should expand to
  final int? minLines;

  /// Sets the maximum number of lines the field can expand to
  final int? maxLines;

  /// Whether the field can expand to fit its content
  final bool? expands;

  /// Whether the field is enabled
  final bool? isEnabled;

  /// Whether the field should autocorrect
  final bool? autoCorrect;

  /// Whether the label should be aligned with the hint
  final bool? alignLabelWithHint;

  /// Validates the field's value
  final String? Function(String?)? validator;

  /// Called when the field's value changes
  final void Function(String?)? onChanged;

  /// Called when the field's editing is complete
  final void Function(String?)? onEditingComplete;

  /// Called when the field's value is submitted
  final void Function(String)? onFieldSubmitted;

  /// Called when the field is tapped
  final void Function()? onTap;

  /// Called when the field is tapped outside
  final void Function(PointerDownEvent)? onTapOutside;

  /// Specifies the keyboard type for the field
  final TextInputType? keyboardType;

  /// Formats the field's value before it is displayed or edited
  final List<TextInputFormatter>? inputFormatters;

  /// Specifies the text capitalization for the field
  final TextCapitalization? textCapitalization;

  /// Specifies the text input action for the field
  final TextInputAction? textInputAction;

  /// Specifies the text direction for the field
  final TextDirection? textDirection;

  /// Specifies the autovalidate mode for the field
  final AutovalidateMode? autovalidateMode;

  /// Specifies the text align for the field
  final TextAlign? textAlign;

  /// Specifies the text align vertical for the field
  final TextAlignVertical? textAlignVertical;

  /// Specifies the hint text for the field
  final String? hintText;

  /// Specifies the label for the field
  final String? label;

  /// Specifies the error text for the field
  final String? errorText;

  /// Specifies the initial value for the field
  final String? initialValue;

  /// Specifies the prefix for the field
  final Widget? prefix;

  /// Specifies the suffix for the field
  final Widget? suffix;

  /// Specifies the prefix icon for the field
  final Widget? prefixIcon;

  /// Specifies the suffix icon for the field
  final Widget? suffixIcon;

  /// Saves the field's value to a form state when the form is saved
  final void Function(String?)? onSaved;

  /// Helper text for additional guidance
  final String? helperText;

  /// Overrides or augments the base text style derived from design tokens
  final TextStyle? style;

  /// Specifies the content padding for the field
  final bool overrideSuffix;

  /// Specifies the length for the OTP field
  final int? length;

  /// Specifies the loading state for the field
  final bool isLoading;

  /// Specifies the semantic label for the field
  final String? semanticLabel;

  /// Returns a new instance with selectively overridden fields
  RootConfig copyWith({
    RootFieldController? controller,
    FocusNode? focusNode,
    bool? obscureText,
    bool? readOnly,
    bool? autoFocus,
    bool? selectAllOnFocus,
    bool? showCursor,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLength,
    int? minLines,
    int? maxLines,
    bool? expands,
    bool? isEnabled,
    bool? autoCorrect,
    bool? alignLabelWithHint,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    void Function(String?)? onEditingComplete,
    void Function(String)? onFieldSubmitted,
    void Function()? onTap,
    void Function(PointerDownEvent)? onTapOutside,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization? textCapitalization,
    TextInputAction? textInputAction,
    TextDirection? textDirection,
    AutovalidateMode? autovalidateMode,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    String? hintText,
    String? label,
    String? errorText,
    String? initialValue,
    Widget? prefix,
    Widget? suffix,
    Widget? prefixIcon,
    Widget? suffixIcon,
    void Function(String?)? onSaved,
    String? helperText,
    TextStyle? style,
    bool? overrideSuffix,
    bool? isLoading,
    String? semanticLabel,
  }) {
    return RootConfig(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      obscureText: obscureText ?? this.obscureText,
      readOnly: readOnly ?? this.readOnly,
      autoFocus: autoFocus ?? this.autoFocus,
      selectAllOnFocus: selectAllOnFocus ?? this.selectAllOnFocus,
      showCursor: showCursor ?? this.showCursor,
      maxLengthEnforcement: maxLengthEnforcement ?? this.maxLengthEnforcement,
      maxLength: maxLength ?? this.maxLength,
      minLines: minLines ?? this.minLines,
      maxLines: maxLines ?? this.maxLines,
      expands: expands ?? this.expands,
      isEnabled: isEnabled ?? this.isEnabled,
      autoCorrect: autoCorrect ?? this.autoCorrect,
      alignLabelWithHint: alignLabelWithHint ?? this.alignLabelWithHint,
      validator: validator ?? this.validator,
      onChanged: onChanged ?? this.onChanged,
      onEditingComplete: onEditingComplete ?? this.onEditingComplete,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
      onTap: onTap ?? this.onTap,
      onTapOutside: onTapOutside ?? this.onTapOutside,
      keyboardType: keyboardType ?? this.keyboardType,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      textCapitalization: textCapitalization ?? this.textCapitalization,
      textInputAction: textInputAction ?? this.textInputAction,
      textDirection: textDirection ?? this.textDirection,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      textAlign: textAlign ?? this.textAlign,
      textAlignVertical: textAlignVertical ?? this.textAlignVertical,
      hintText: hintText ?? this.hintText,
      label: label ?? this.label,
      errorText: errorText ?? this.errorText,
      initialValue: initialValue ?? this.initialValue,
      prefix: prefix ?? this.prefix,
      suffix: suffix ?? this.suffix,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      onSaved: onSaved ?? this.onSaved,
      helperText: helperText ?? this.helperText,
      style: style ?? this.style,
      overrideSuffix: overrideSuffix ?? this.overrideSuffix,
      isLoading: isLoading ?? this.isLoading,
      semanticLabel: semanticLabel ?? this.semanticLabel,
    );
  }
}
