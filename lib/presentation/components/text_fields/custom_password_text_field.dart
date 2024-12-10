import 'package:flutter/material.dart';
import 'package:job_search/presentation/assets/icons.dart';

import '../../presentation.dart';

class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.errorText,
    required this.inputController,
    this.onSubmit,
    this.onSuffixPressed,
    this.isObscureText = true,
  });

  final String title;
  final String hintText;
  final String errorText;
  final TextEditingController inputController;
  final Function(String)? onSubmit;
  final Function()? onSuffixPressed;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        _textField(),
        xxxsSpacer(),
        if (errorText.isNotEmpty) _errorText(),
      ],
    );
  }

  Widget _title() => Padding(
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
      );

  Widget _textField() => Container(
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
          minLines: 1,
          autofocus: true,
          controller: inputController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: isObscureText,
          textInputAction: TextInputAction.done,
          textAlignVertical: TextAlignVertical.center,
          onSubmitted: (value) => onSubmit!(value),
          cursorColor: AppColors.primaryOrange,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(Dimensions.xs),
            isDense: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            errorMaxLines: 1,
            hintText: hintText,
            hintStyle: TextStyles.body0Regular(color: AppColors.black[400]),
            suffixIcon: IconButton(
              icon: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
                size: Dimensions.md,
              ),
              onPressed: onSuffixPressed,
            ),
            prefixIcon: const Icon(
              AppIcons.fLockIcon,
              size: Dimensions.sm,
            ),
            prefixIconColor: Colors.grey,
          ),
          style: TextStyles.body0Semibold(),
        ),
      );

  Widget _errorText() => Padding(
        padding: const EdgeInsets.only(left: Dimensions.xs),
        child: Text(
          errorText,
          style: TextStyles.footnoteRegular(color: AppColors.error),
        ),
      );
}
