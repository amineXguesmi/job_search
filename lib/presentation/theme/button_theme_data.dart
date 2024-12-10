part of 'button_theme.dart';

enum ButtonStyle { regular, disabled, error, success, none }

enum ButtonVariant { filled, outlined, ghost }

enum ButtonSize { extraSmall, small, medium, large }

@immutable
class ButtonThemeData {
  const ButtonThemeData({
    required this.backgroundColor,
    required this.borderColor,
    required this.padding,
    required this.borderRadius,
    required this.fontStyle,
  });

  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsets padding;
  final BorderRadiusGeometry borderRadius;
  final TextStyle fontStyle;
}