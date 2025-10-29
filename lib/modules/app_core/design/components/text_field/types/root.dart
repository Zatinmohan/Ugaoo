import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:ugaoo/modules/app_core/design/components/sizebox/stem.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/model/root_config.dart';
import 'package:ugaoo/modules/app_core/design/components/text_field/model/root_field_controller.dart';
import 'package:ugaoo/modules/app_core/design/components/widgets/shimmer.dart';
import 'package:ugaoo/modules/app_core/design/extensions/design_extension.dart';
import 'package:ugaoo/modules/app_core/design/widgets/custom_animated_switcher.dart';

part '../raw_text_field.dart';
part '../root_mixin.dart';
part 'default_root.dart';
part 'otp_root.dart';

/// [Root] is the base class for the root text field
abstract class Root extends StatelessWidget {
  /// Creates a [Root]
  factory Root({
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
    void Function(String?)? onSaved,
    void Function(String?)? onChanged,
    void Function()? onEditingComplete,
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
    String? helperText,
    String? label,
    String? errorText,
    String? initialValue,
    TextStyle? style,
    Widget? prefix,
    Widget? suffix,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool overrideSuffix = false,
  }) =>
      _DefaultRoot(
        RootConfig(
          controller: controller,
          focusNode: focusNode,
          obscureText: obscureText,
          readOnly: readOnly,
          autoFocus: autoFocus,
          selectAllOnFocus: selectAllOnFocus,
          showCursor: showCursor,
          maxLengthEnforcement: maxLengthEnforcement,
          maxLength: maxLength,
          minLines: minLines,
          maxLines: maxLines,
          expands: expands,
          isEnabled: isEnabled,
          autoCorrect: autoCorrect,
          alignLabelWithHint: alignLabelWithHint,
          validator: validator,
          onSaved: onSaved,
          onChanged: onChanged,
          onEditingComplete: (value) => onEditingComplete?.call(),
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          onTapOutside: onTapOutside,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          textDirection: textDirection,
          autovalidateMode: autovalidateMode,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          hintText: hintText,
          helperText: helperText,
          label: label,
          errorText: errorText,
          initialValue: initialValue,
          style: style,
          prefix: prefix,
          suffix: suffix,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          overrideSuffix: overrideSuffix,
        ),
      );

  /// Creates a [Root] for an OTP field
  factory Root.otp({
    RootFieldController? controller,
    FocusNode? focusNode,
    bool? isEnabled,
    bool? autoFocus,
    bool? showCursor,
    int? length,
    void Function(String?)? onChanged,
    void Function(String?)? onEditingComplete,
    void Function(String)? onFieldSubmitted,
    void Function()? onTap,
    void Function(PointerDownEvent)? onTapOutside,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool isLoading = false,
  }) =>
      _OtpRoot(RootConfig(
        controller: controller,
        focusNode: focusNode,
        isEnabled: isEnabled,
        autoFocus: autoFocus,
        showCursor: showCursor,
        length: length,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        onTapOutside: onTapOutside,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        isLoading: isLoading,
      ));

  const Root._(this.config);

  /// The configuration for the root text field
  final RootConfig config;
}
