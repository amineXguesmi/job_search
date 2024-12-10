import 'package:flutter/material.dart' hide ButtonStyle, ButtonTheme;

import '../../theme/button_theme.dart';
import 'base_buttons.dart';

class SmallFilledRegularButton extends RegularButton {
  SmallFilledRegularButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    Color? fillColor,
    TextStyle? fontStyle,
    bool isLoading = false,
    BoxConstraints? constraints,
  }) : super(
          variant: ButtonVariant.filled,
          size: ButtonSize.small,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          fillColor: fillColor,
          fontStyle: fontStyle,
          isLoading: isLoading,
          constraints: constraints,
        );
}

class SmallOutlinedRegularButton extends RegularButton {
  SmallOutlinedRegularButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    Color? fillColor,
    TextStyle? fontStyle,
    Color? borderColor,
    bool isLoading = false,
    BoxConstraints? constraints,
  }) : super(
          variant: ButtonVariant.outlined,
          size: ButtonSize.small,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          fillColor: fillColor,
          fontStyle: fontStyle,
          borderColor: borderColor,
          isLoading: isLoading,
          constraints: constraints,
        );
}

class MediumFilledRegularButton extends RegularButton {
  MediumFilledRegularButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    Color? fillColor,
    bool isLoading = false,
    BoxConstraints? constraints,
    TextStyle? fontStyle,
  }) : super(
          variant: ButtonVariant.filled,
          size: ButtonSize.medium,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          fillColor: fillColor,
          isLoading: isLoading,
          constraints: constraints,
          fontStyle: fontStyle,
        );
}

class MediumOutlinedRegularButton extends RegularButton {
  MediumOutlinedRegularButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    TextStyle? fontStyle,
    Color? borderColor,
    bool isLoading = false,
    BoxConstraints? constraints,
  }) : super(
          variant: ButtonVariant.outlined,
          size: ButtonSize.medium,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          fontStyle: fontStyle,
          borderColor: borderColor,
          isLoading: isLoading,
          constraints: constraints,
        );
}

class LargeFilledRegularButton extends RegularButton {
  LargeFilledRegularButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    Color? fillColor,
    TextStyle? fontStyle,
    Color? borderColor,
    bool isLoading = false,
    BoxConstraints? constraints,
  }) : super(
          variant: ButtonVariant.filled,
          size: ButtonSize.large,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          fillColor: fillColor,
          fontStyle: fontStyle,
          borderColor: borderColor,
          isLoading: isLoading,
          constraints: constraints,
        );
}

class LargeOutlinedRegularButton extends RegularButton {
  LargeOutlinedRegularButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    bool expanded = false,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    TextStyle? fontStyle,
    Color? borderColor,
    bool isLoading = false,
    BoxConstraints? constraints,
  }) : super(
          variant: ButtonVariant.outlined,
          size: ButtonSize.large,
          text: text,
          leading: leading,
          trailing: trailing,
          expanded: expanded,
          onPressed: onPressed,
          onLongPress: onLongPress,
          fontStyle: fontStyle,
          borderColor: borderColor,
          isLoading: isLoading,
          constraints: constraints,
        );
}

class ExtraSmallFilledRegularButton extends RegularButton {
  ExtraSmallFilledRegularButton({
    super.key,
    String? text,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    TextStyle? fontStyle,
    Color? borderColor,
    bool isLoading = false,
    BoxConstraints? constraints,
  }) : super(
          variant: ButtonVariant.filled,
          size: ButtonSize.extraSmall,
          text: text,
          leading: leading,
          trailing: trailing,
          onPressed: onPressed,
          onLongPress: onLongPress,
          isLoading: isLoading,
          constraints: constraints,
          fontStyle: fontStyle,
          borderColor: borderColor,
        );
}
