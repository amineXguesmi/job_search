import 'package:flutter/material.dart' hide ButtonStyle, ButtonTheme;

import '../../theme/button_theme.dart';
import 'base_buttons.dart';

class SmallFilledSuccessButton extends SuccessButton {
  SmallFilledSuccessButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool isLoading = false,
  }) : super(
          variant: ButtonVariant.filled,
          size: ButtonSize.small,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          isLoading: isLoading,
        );
}

class SmallOutlinedSuccessButton extends SuccessButton {
  SmallOutlinedSuccessButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool isLoading = false,
  }) : super(
          variant: ButtonVariant.outlined,
          size: ButtonSize.small,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          isLoading: isLoading,
        );
}

class MediumFilledSuccessButton extends SuccessButton {
  MediumFilledSuccessButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool isLoading = false,
  }) : super(
          variant: ButtonVariant.filled,
          size: ButtonSize.medium,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          isLoading: isLoading,
        );
}

class MediumOutlinedSuccessButton extends SuccessButton {
  MediumOutlinedSuccessButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
  }) : super(
          variant: ButtonVariant.outlined,
          size: ButtonSize.medium,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
        );
}

class LargeFilledSuccessButton extends SuccessButton {
  LargeFilledSuccessButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
  }) : super(
          variant: ButtonVariant.filled,
          size: ButtonSize.large,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
        );
}

class LargeOutlinedSuccessButton extends SuccessButton {
  LargeOutlinedSuccessButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
  }) : super(
          variant: ButtonVariant.outlined,
          size: ButtonSize.large,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
        );
}
