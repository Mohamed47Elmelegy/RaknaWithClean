import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theme/colors_theme.dart';

class PlatformSignin extends StatelessWidget {
  final VoidCallback onTap;
  final Color? color;
  final String? image;
  final double? width;
  final double? height;
  const PlatformSignin({
    super.key,
    required this.onTap,
    this.color,
    this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 77,
        height: 72,
        decoration: ShapeDecoration(
          color: AppColors.greyScale50,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: AppColors.goldenYellow),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: SvgPicture.asset(
          image!,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
