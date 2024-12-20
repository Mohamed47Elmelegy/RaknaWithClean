import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        ),
        const Gap(8.5),
        Expanded(
          child: FittedBox(
            child: Row(
              children: [
                Text.rich(
                  TextSpan(
                      text: 'i agree to the terms of service and',
                      style: AppTextStyles.bebasRegular15
                          .copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                          text: ' privacy police',
                          style: AppTextStyles.bebasRegular15
                              .copyWith(color: AppColors.blue),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
