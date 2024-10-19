import 'package:clean_rakna/core/extensions/padding_ext.dart';
import 'package:flutter/material.dart';
import '../../../../../core/config/constants.dart';
import '../../../../../core/theme/colors_theme.dart';
import '../../../../../core/theme/text_theme.dart';
import 'custom_checkbox.dart';

class TermsAndConditionsCheckbox extends StatefulWidget {
  const TermsAndConditionsCheckbox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  TermsAndConditionsCheckboxState createState() =>
      TermsAndConditionsCheckboxState();
}

class TermsAndConditionsCheckboxState
    extends State<TermsAndConditionsCheckbox> {
  bool isTermsAccept = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          onChecked: (value) {
            isTermsAccept = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccept,
        ).setOnlyPadding(context, 0, 0, 0, 20, enableMediaQuery: false),
        SizedBox(
          width: Constants.mediaQuery.width * 0.7,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: ' i agree to the terms of service and  ',
                  style: AppTextStyles.bebasRegular15
                      .copyWith(color: Colors.white),
                ),
                TextSpan(
                  text: ' privcy police',
                  style: AppTextStyles.bebasRegular15
                      .copyWith(color: AppColors.blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
