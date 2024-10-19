import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_images.dart';
import '../manager/signin_cubit.dart';
import 'custom_platform_signin.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformSignin(
      image: Assets.imagesGoogle,
      onTap: () {
        context.read<SigninCubit>().signInWithGoogle();
      },
    );
  }
}
