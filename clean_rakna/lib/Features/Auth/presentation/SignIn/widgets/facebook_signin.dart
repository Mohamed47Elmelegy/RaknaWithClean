import 'package:clean_rakna/Features/Auth/presentation/SignIn/widgets/custom_platform_signin.dart';
import 'package:clean_rakna/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class FacebookSignIn extends StatelessWidget {
  const FacebookSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformSignin(
      image: Assets.imagesFacebook,
      onTap: () {},
    );
  }
}
