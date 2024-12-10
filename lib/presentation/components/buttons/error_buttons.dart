import 'package:flutter/material.dart' hide ButtonStyle, ButtonTheme;

import '../../theme/button_theme.dart';
import 'base_buttons.dart';

class SmallFilledErrorButton extends ErrorButton {
  SmallFilledErrorButton({
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

class SmallOutlinedErrorButton extends ErrorButton {
  SmallOutlinedErrorButton({
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

class MediumFilledErrorButton extends ErrorButton {
  MediumFilledErrorButton({
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

class MediumOutlinedErrorButton extends ErrorButton {
  MediumOutlinedErrorButton({
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

class LargeFilledErrorButton extends ErrorButton {
  LargeFilledErrorButton({
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
          size: ButtonSize.large,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          isLoading: isLoading,
        );
}

class LargeOutlinedErrorButton extends ErrorButton {
  LargeOutlinedErrorButton({
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
          size: ButtonSize.large,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          isLoading: isLoading,
        );
}
