import 'package:flutter/material.dart';
import '../../../../../core/utils/app_images.dart';
import 'custom_platform_signin.dart';

class AppleSignin extends StatelessWidget {
  const AppleSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformSignin(
      image: Assets.imagesApple,
      onTap: () {},
    );
  }
}
