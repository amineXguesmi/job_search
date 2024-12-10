import 'package:flutter/material.dart';

import '../../presentation.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.errorText,
    required this.inputController,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.titleSuffix,
    this.prefixIcon,
    this.suffixIcon,
    this.onSubmit,
    this.onChanged,
    this.obscureText,
    this.autoFocus,
  });

  final String title;
  final String hintText;
  final String errorText;
  final TextEditingController inputController;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? titleSuffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? autoFocus;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.xs,
                bottom: Dimensions.xxxs,
              ),
              child: Text(
                title,
                style: TextStyles.calloutMedium(
                  color: AppColors.primaryOrange,
                ),
              ),
            ),
            if (titleSuffix != null)
              Padding(
                padding: const EdgeInsets.only(
                  right: Dimensions.xs,
                  left: Dimensions.xs,
                  bottom: Dimensions.xxxs,
                ),
                child: Text(
                  titleSuffix.toString(),
                  style: TextStyles.footnoteMedium(
                    color: AppColors.black.shade400,
                  ),
                ),
              ),
          ],
        ),

        // Text field
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.md),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
            color: Colors.white,
          ),
          child: TextField(
            key: key,
            autofocus: autoFocus ?? false,
            obscureText: obscureText ?? false,
            focusNode: focusNode,
            minLines: 1,
            controller: inputController,
            keyboardType: keyboardType,
            textCapitalization:
                keyboardType == TextInputType.emailAddress ? TextCapitalization.none : TextCapitalization.sentences,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.done,
            cursorColor: AppColors.primaryOrange,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(Dimensions.xs),
              fillColor: Colors.white,
              errorMaxLines: 1,
              hintText: hintText,
              hintStyle: TextStyles.body0Regular(color: AppColors.black[400]),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              isDense: true,
            ),
            style: TextStyles.body0Semibold(),
          ),
        ),

        xxxsSpacer(),

        // Error text
        Visibility(
          visible: errorText.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(left: Dimensions.xs),
            child: Text(
              errorText,
              style: TextStyles.footnoteRegular(color: AppColors.error),
            ),
          ),
        ),
      ],
    );
  }
}
