import 'package:flutter/material.dart';

import '../../presentation.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    super.key,
    this.leading,
    this.onPressed,
    this.color,
    this.borderColor,
    this.iconColor,
    this.iconDimension,
    this.borderWidth,
  });

  final Widget? leading;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? borderColor;
  final Color? iconColor;
  final double? iconDimension;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.pop(context),
      onLongPress: () {},
      onDoubleTap: () {},
      behavior: HitTestBehavior.translucent,
      child: Row(
        mainAxisAlignment: (leading != null) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          leading ?? const SizedBox.shrink(),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0),
            ),
            child: Padding(
              padding: Paddings.allXxxxs,
              child: Icon(
                Icons.close_rounded,
                color: iconColor,
                weight: 1000,
                size: iconDimension,
              ),
            ),
          ),
        ].withSpacing(
          xxxsSpacer(),
        ),
      ),
    );
  }
}

class SmallExitButton extends ExitButton {
  const SmallExitButton({
    Key? key,
    Widget? leading,
    VoidCallback? onPressed,
    Color? color,
    Color? borderColor,
    Color? iconColor,
  }) : super(
          key: key,
          leading: leading,
          onPressed: onPressed,
          color: color,
          borderColor: borderColor,
          iconColor: iconColor,
          iconDimension: Dimensions.xxs,
          borderWidth: 2,
        );
}

class RegularExitButton extends ExitButton {
  const RegularExitButton({
    Key? key,
    Widget? leading,
    VoidCallback? onPressed,
    Color? color,
    Color? borderColor,
    Color? iconColor,
    double? iconDimension,
  }) : super(
          key: key,
          leading: leading,
          onPressed: onPressed,
          color: color,
          borderColor: borderColor,
          iconColor: iconColor,
          iconDimension: iconDimension ?? Dimensions.sm,
          borderWidth: 2,
        );
}
