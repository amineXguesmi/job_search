import 'package:flutter/material.dart';
import '../presentation.dart';

part 'button_theme_data.dart';

@immutable
class ButtonTheme {
  const ButtonTheme({
    required this.style,
    required this.variant,
    required this.size,
  });

  final ButtonStyle style;
  final ButtonVariant variant;
  final ButtonSize size;

  Color _backgroundColor() {
    if (variant == ButtonVariant.outlined || variant == ButtonVariant.ghost) {
      return Colors.transparent;
    }

    switch (style) {
      case ButtonStyle.regular:
        return AppColors.primaryOrange;
      case ButtonStyle.disabled:
        return AppColors.black.shade100;
      case ButtonStyle.error:
        return AppColors.error;
      case ButtonStyle.success:
        return AppColors.success;
      case ButtonStyle.none:
        return Colors.transparent;
    }
  }

  Color _borderColor() {
    if (variant == ButtonVariant.filled || variant == ButtonVariant.ghost) {
      return Colors.transparent;
    }

    return _mainColors();
  }

  Color _textColor() {
    if (variant == ButtonVariant.filled) {
      return style == ButtonStyle.disabled ? AppColors.black.shade400 : Colors.white;
    } else if (variant == ButtonVariant.ghost) {
      return AppColors.black.shade700;
    }

    return _mainColors();
  }

  Color _mainColors() {
    switch (style) {
      case ButtonStyle.regular:
        return AppColors.primaryOrange;
      case ButtonStyle.disabled:
        return AppColors.black.shade400;
      case ButtonStyle.error:
        return AppColors.error;
      case ButtonStyle.success:
        return AppColors.success;
      case ButtonStyle.none:
        return Colors.transparent;
    }
  }

  EdgeInsets _padding() {
    switch (size) {
      case ButtonSize.extraSmall:
        return const EdgeInsets.symmetric(
          horizontal: Dimensions.xxs,
          vertical: Dimensions.xxxs,
        );
      case ButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: Dimensions.md,
          vertical: Dimensions.xxxs,
        );
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: Dimensions.md,
          vertical: Dimensions.xxs,
        );
      case ButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: Dimensions.md,
          vertical: Dimensions.xs,
        );
    }
  }

  ButtonThemeData get buttonThemeData => ButtonThemeData(
        backgroundColor: _backgroundColor(),
        borderColor: _borderColor(),
        padding: _padding(),
        borderRadius: BorderRadius.circular(Dimensions.lg),
        fontStyle: TextStyles.buttonMedium(color: _textColor()),
      );
}