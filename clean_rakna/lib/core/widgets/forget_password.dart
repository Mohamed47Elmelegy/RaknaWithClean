import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';
import '../theme/text_theme.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            'Forgot Password ?',
            style: AppTextStyles.interBold12
                .copyWith(color: AppColors.goldenYellow),
          ),
        ),
      ],
    );
  }
}
