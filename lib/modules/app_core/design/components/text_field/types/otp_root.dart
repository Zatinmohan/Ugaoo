part of 'root.dart';

final class _OtpRoot extends Root {
  const _OtpRoot(super.config) : super._();

  @override
  Widget build(BuildContext context) {
    final isDisabled = !(config.isEnabled ?? true);
    final textStyle = context.typographic.bodyLarge
        .copyWith(color: context.color.textPrimary);

    final borderColor = isDisabled
        ? context.color.disabled.withValues(alpha: 0.4)
        : context.color.disabled.withValues(alpha: 0.6);

    final focusedBorderColor = isDisabled ? borderColor : context.color.primary;

    final errorBorderColor = context.color.error;

    final pinTheme = PinTheme(
      width: context.w(context.spaceToken.space7),
      height: context.h(context.spaceToken.space7),
      textStyle: textStyle,
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.circular(context.r(context.radius.medium)),
        border: Border.all(
          color: borderColor,
        ),
      ),
    );
    return Semantics(
      textField: true,
      enabled: !isDisabled,
      // label: config.semanticLabel ?? 'OTP input field',
      child: Pinput(
        controller: config.controller != null
            ? (config.controller! as OtpRootFieldController).controller
            : null,
        length: config.length ?? 4,
        showCursor: config.showCursor ?? true,
        autofocus: config.autoFocus ?? false,
        onChanged: config.onChanged,
        onCompleted: config.onEditingComplete,
        onTap: config.onTap,
        onTapOutside: config.onTapOutside,
        readOnly: config.readOnly ?? false,
        focusNode: config.focusNode,
        validator: config.validator,
        keyboardType: config.keyboardType ?? TextInputType.number,
        inputFormatters: config.inputFormatters ?? [],
        textCapitalization:
            config.textCapitalization ?? TextCapitalization.none,
        textInputAction: config.textInputAction,
        enabled: config.isEnabled ?? true,
        defaultPinTheme: pinTheme,
        focusedPinTheme: pinTheme.copyDecorationWith(
          border: Border.all(color: focusedBorderColor, width: 1.5),
        ),
        errorPinTheme: pinTheme.copyDecorationWith(
          border: Border.all(color: errorBorderColor, width: 1.5),
        ),
        submittedPinTheme: pinTheme.copyDecorationWith(
          border: Border.all(color: context.color.primary, width: 1.5),
          color: context.color.surface.withValues(alpha: 0.95),
        ),
        cursor: Container(
          width: 2,
          height: context.h(context.spaceToken.space5),
          color: context.color.primary,
        ),
      ),
    );
  }
}
