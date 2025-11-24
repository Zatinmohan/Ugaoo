part of '../text_field/types/root.dart';

/// RawTextField is an internal, token-aware wrapper around Material
/// `TextFormField`, applying Ugaoo typography, colors, spacing, and borders
/// via `InputDecoration` while preserving native form, focus, and submission
/// semantics for integration inside Flutter `Form`s and validation flows
class RawTextField extends StatefulWidget {
  /// Creates a RawTextField that decorates and configures a Material
  /// `TextFormField` using Ugaoo design tokens for a consistent look-and-feel
  /// across states while forwarding core input, validation, and submission
  /// behavior to the platform widgets underneath
  const RawTextField({
    this.controller,
    this.initialValue,
    this.focusNode,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.obscureText,
    this.hintText,
    this.textAlign,
    this.textAlignVertical,
    this.style,
    this.readOnly,
    this.autoFocus,
    this.autoCorrect,
    this.selectAllOnFocus,
    this.showCursor,
    this.maxLengthEnforcement,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.expands,
    this.isEnabled,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.onTapOutside,
    this.inputFormatters,
    this.textCapitalization,
    this.textInputAction,
    this.textDirection,
    this.label,
    this.errorText,
    this.helperText,
    this.autovalidateMode,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.alignLabelWithHint,
    this.overrideSuffix = false,
    this.animationController,
    super.key,
  });

  /// Controls the editable text, selection, and composing region; when supplied
  /// it becomes the source of truth for
  /// the field’s value within `TextFormField`
  final TextEditingController? controller;

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

  /// Saves the field's value to a form state when the form is saved
  final void Function(String?)? onSaved;

  /// Called when the field's value changes
  final void Function(String?)? onChanged;

  /// Called when the field's editing is complete
  final void Function()? onEditingComplete;

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

  /// Overrides or augments the base text style derived from design tokens
  final TextStyle? style;

  /// Specifies the label for the field
  final String? label;

  /// Specifies the error text for the field
  final String? errorText;

  /// Specifies the helper text for the field (shown below the input)
  final String? helperText;

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

  /// Specifies the content padding for the field
  final bool overrideSuffix;

  /// Animation controller for the field
  final AnimationController? animationController;

  @override
  State<RawTextField> createState() => _RawTextFieldState();
}

class _RawTextFieldState extends State<RawTextField> {
  late final VoidCallback _controllerListener;
  var _showSuffix = false;
  @override
  void initState() {
    super.initState();
    _controllerListener = _updateSuffixVisibility;
    widget.controller?.addListener(_controllerListener);
    // Set initial state
    _updateSuffixVisibility();
  }

  @override
  void didUpdateWidget(RawTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the controller instance changes, update the listeners.
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_controllerListener);
      widget.controller?.addListener(_controllerListener);
      // Update state for the new controller.
      _updateSuffixVisibility();
    }
  }

  void _updateSuffixVisibility() {
    final shouldShow = widget.controller?.text.trim().isNotEmpty ?? false;
    // Only call setState if the value has actually changed.
    if (mounted && _showSuffix != shouldShow) {
      setState(() {
        _showSuffix = shouldShow;
      });
    }
  }

  @override
  void dispose() {
    // IMPORTANT: Remove the listener to prevent memory leaks.
    widget.controller?.removeListener(_controllerListener);
    super.dispose();
  }

  Widget get _buildSuffix {
    if (widget.overrideSuffix) return widget.suffix ?? const SizedBox.shrink();
    if (_showSuffix) {
      return GestureDetector(
        onTap: () {
          widget.controller?.clear();
        },
        child: Icon(
          Icons.close,
          size: 16,
          color: context.color.primary,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.typographic.bodyLarge
        .copyWith(color: context.color.textPrimary);

    final hintStyle = context.typographic.bodyLarge
        .copyWith(color: context.color.textSecondary);

    final errorStyle =
        context.typographic.caption.copyWith(color: context.color.error);

    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.r(context.radius.large)),
      borderSide: BorderSide(color: context.color.disabled),
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.r(context.radius.large)),
      borderSide: BorderSide(color: context.color.primary, width: 1.5),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.r(context.radius.large)),
      borderSide: BorderSide(color: context.color.error, width: 1.5),
    );
    final effectiveTextStyle =
        widget.style != null ? textStyle.merge(widget.style) : textStyle;

    Widget textField() => TextFormField(
          enabled: widget.isEnabled,
          autocorrect: widget.autoCorrect ?? true,
          autovalidateMode: widget.autovalidateMode,
          inputFormatters: widget.inputFormatters,
          readOnly: widget.readOnly ?? false,
          autofocus: widget.autoFocus ?? false,
          showCursor: widget.showCursor,
          selectAllOnFocus: widget.selectAllOnFocus,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          expands: widget.expands ?? false,
          maxLength: widget.maxLength,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          controller: widget.controller,
          validator: widget.validator,
          onSaved: widget.onSaved,
          initialValue: widget.initialValue,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText ?? false,
          textAlign: widget.textAlign ?? TextAlign.start,
          textAlignVertical: widget.textAlignVertical,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: widget.onTap,
          onTapOutside: widget.onTapOutside,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          textInputAction: widget.textInputAction,
          textDirection: widget.textDirection,
          style: effectiveTextStyle,
          decoration: InputDecoration(
            alignLabelWithHint:
                widget.alignLabelWithHint ?? (widget.maxLines != 1),
            // text
            labelText: widget.label,
            hintText: widget.hintText,
            helperText: widget.helperText,
            errorText: widget.errorText,
            // Apply styles
            filled: true,
            fillColor: context.color.surface,
            hintStyle: hintStyle,
            labelStyle: hintStyle, // Label uses the same style as hint
            errorStyle: errorStyle,
            // Apply borders
            border: defaultBorder,
            enabledBorder: defaultBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            disabledBorder: defaultBorder,

            suffixIcon: _buildSuffix,
            prefixIcon: widget.prefixIcon,
            prefix: widget.prefix,
            contentPadding: EdgeInsets.all(context.i(context.padding.regular)),
          ),
        );

    return widget.animationController != null
        ? ShakeWidget(
            animationController: widget.animationController!,
            child: textField(),
          )
        : textField();
  }
}
