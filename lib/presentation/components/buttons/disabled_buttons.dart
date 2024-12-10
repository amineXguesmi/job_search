import 'package:flutter/material.dart' hide ButtonStyle, ButtonTheme;

import '../../theme/button_theme.dart';
import 'base_buttons.dart';

class SmallFilledDisabledButton extends DisabledButton {
  SmallFilledDisabledButton({
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

class SmallOutlinedDisabledButton extends DisabledButton {
  SmallOutlinedDisabledButton({
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

class MediumFilledDisabledButton extends DisabledButton {
  MediumFilledDisabledButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    TextStyle? fontStyle,
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
          fontStyle: fontStyle,
          isLoading: isLoading,
        );
}

class MediumOutlinedDisabledButton extends DisabledButton {
  MediumOutlinedDisabledButton({
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

class LargeFilledDisabledButton extends DisabledButton {
  LargeFilledDisabledButton({
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

class LargeOutlinedDisabledButton extends DisabledButton {
  LargeOutlinedDisabledButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool isLaoding = false,
  }) : super(
          variant: ButtonVariant.outlined,
          size: ButtonSize.large,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          isLoading: isLaoding,
        );
}
