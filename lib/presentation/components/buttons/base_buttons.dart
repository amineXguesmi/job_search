import 'package:flutter/material.dart' hide ButtonStyle, ButtonTheme;

import '../../presentation.dart';
import '../../theme/button_theme.dart';

@immutable
class BaseButton extends StatelessWidget {
  BaseButton({
    super.key,
    required this.style,
    required this.variant,
    required this.size,
    this.text,
    this.leading,
    this.trailing,
    this.fillColor,
    this.onPressed,
    this.onLongPress,
    this.fontStyle,
    this.expanded = false,
    this.isLoading = false,
    this.borderColor,
    this.loadingColor,
    this.constraints,
  }) : theme = ButtonTheme(
          style: style,
          variant: variant,
          size: size,
        );

  final ButtonStyle style;
  final ButtonVariant variant;
  final ButtonSize size;
  final String? text;
  final Widget? leading;
  final Widget? trailing;
  final Color? fillColor;
  final bool expanded;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ButtonTheme theme;
  final TextStyle? fontStyle;
  final Color? borderColor;
  final bool isLoading;
  final Color? loadingColor;
  final BoxConstraints? constraints;

  @override
  GestureDetector build(BuildContext context) {
    final themeData = theme.buttonThemeData;

    return GestureDetector(
      onTap: !isLoading ? onPressed : () {},
      onLongPress: !isLoading ? onLongPress : () {},
      onDoubleTap: () {},
      child: Container(
        constraints: constraints,
        padding: expanded
            ? EdgeInsets.symmetric(
                vertical: themeData.padding.vertical / 2,
                horizontal: Dimensions.xs,
              )
            : themeData.padding,
        decoration: BoxDecoration(
          color: fillColor ?? themeData.backgroundColor,
          border: Border.all(color: borderColor ?? themeData.borderColor),
          borderRadius: themeData.borderRadius,
        ),
        child: _content(themeData),
      ),
    );
  }

  Widget _content(themeData) => Row(
        mainAxisAlignment: (expanded && trailing != null && leading != null)
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        children: !isLoading
            ? [
                leading ?? const SizedBox.shrink(),
                if (text != null)
                  Text(
                    text!,
                    style: fontStyle ?? themeData.fontStyle,
                    textAlign: TextAlign.center,
                  ),
                trailing ?? const SizedBox.shrink(),
              ].withSpacing(!expanded ? xxxsSpacer() : const SizedBox.shrink())
            : [
                _loaderWidget(themeData),
              ],
      );

  Widget _loaderWidget(themeData) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: fontStyle ?? themeData.fontStyle,
      ),
      textDirection: TextDirection.ltr,
      strutStyle: StrutStyle.fromTextStyle(fontStyle ?? themeData.fontStyle),
      textAlign: TextAlign.center,
    );

    textPainter.layout();

    return Container(
      height: textPainter.height,
      width: textPainter.height,
      margin: EdgeInsets.symmetric(
        horizontal: (textPainter.width / 2) - 2,
        vertical: 2, // to keep consistent button size when changing between text and loader
      ),
      child: CircularProgressIndicator(
        strokeWidth: 3,
        color: loadingColor ?? themeData.fontStyle.color,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class RegularButton extends BaseButton {
  RegularButton({
    super.key,
    required ButtonVariant variant,
    required ButtonSize size,
    String? text,
    Widget? leading,
    Widget? trailing,
    Color? fillColor,
    TextStyle? fontStyle,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool isLoading = false,
    Color? borderColor,
    BoxConstraints? constraints,
  }) : super(
          style: ButtonStyle.regular,
          variant: variant,
          size: size,
          text: text,
          leading: leading,
          trailing: trailing,
          fillColor: fillColor,
          fontStyle: fontStyle,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          borderColor: borderColor,
          isLoading: isLoading,
          constraints: constraints,
        );
}

class DisabledButton extends BaseButton {
  DisabledButton({
    super.key,
    required ButtonVariant variant,
    required ButtonSize size,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool isLoading = false,
    TextStyle? fontStyle,
    BoxConstraints? constraints,
  }) : super(
          style: ButtonStyle.disabled,
          variant: variant,
          size: size,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          fontStyle: fontStyle,
          isLoading: isLoading,
          constraints: constraints,
        );
}

class ErrorButton extends BaseButton {
  ErrorButton({
    super.key,
    required ButtonVariant variant,
    required ButtonSize size,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool isLoading = false,
    BoxConstraints? constraints,
  }) : super(
          style: ButtonStyle.error,
          variant: variant,
          size: size,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          isLoading: isLoading,
          constraints: constraints,
        );
}

class SuccessButton extends BaseButton {
  SuccessButton({
    super.key,
    required ButtonVariant variant,
    required ButtonSize size,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool isLoading = false,
    BoxConstraints? constraints,
  }) : super(
          style: ButtonStyle.success,
          variant: variant,
          size: size,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          isLoading: isLoading,
          constraints: constraints,
        );
}
