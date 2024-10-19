import 'package:flutter/material.dart';
import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';

class AccountCreationPrompt extends StatelessWidget {
  const AccountCreationPrompt({
    super.key,
    required this.onPressed,
    required this.text,
    required this.buttonText,
  });
  final VoidCallback onPressed;
  final String text;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.inriaSansBold16.copyWith(
            color: Colors.white,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppTextStyles.inriaSansBold16.copyWith(
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
