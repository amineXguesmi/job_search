import 'package:flutter/material.dart' hide ButtonStyle, ButtonTheme;

import '../../theme/button_theme.dart';
import 'base_buttons.dart';

class GhostButton extends BaseButton {
  GhostButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool isLoading = false,
  }) : super(
          style: ButtonStyle.none,
          variant: ButtonVariant.ghost,
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
