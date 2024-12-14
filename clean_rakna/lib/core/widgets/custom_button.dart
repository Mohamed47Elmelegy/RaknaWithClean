// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:clean_rakna/core/theme/colors_theme.dart';
import 'package:clean_rakna/core/theme/text_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.width,
    this.height,
    this.color,
    this.textColor,
  });

  final VoidCallback? onTap;
  final String text;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Container(
              decoration: ShapeDecoration(
                  color: color ?? AppColors.greydark,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1, color: color ?? AppColors.greyScale50),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x30f8a00e),
                      blurRadius: 19.80,
                      offset: Offset(0, 5),
                      spreadRadius: -2,
                    )
                  ]),
              width: width,
              height: height,
              child: Center(
                child: Text(
                  text,
                  style: AppTextStyles.interSemiBold17
                      .copyWith(color: textColor ?? Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
