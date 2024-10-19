import 'package:clean_rakna/Features/Auth/presentation/SignIn/widgets/facebook_signin.dart';
import 'package:clean_rakna/Features/Auth/presentation/SignIn/widgets/goolge_signin.dart';
import 'package:clean_rakna/core/extensions/padding_ext.dart';
import 'package:clean_rakna/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../../core/errors/validators_erros.dart';
import '../../../../../core/routes/routes/page_routes_name.dart';
import '../../../../../core/theme/colors_theme.dart';
import '../../../../../core/theme/text_theme.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/account_creation_prompt.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/forget_password.dart';
import '../../../../../main.dart';
import '../manager/signin_cubit.dart';
import 'apple_signin.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2b2b2b),
      body: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(Assets.imagesLoginTopRight),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(160),
                  Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(Assets.imagesSignInlogo),
                        const SizedBox(height: 20),
                        Text(
                          "Where Innovation Parks Safely",
                          style: AppTextStyles.caveatRegular.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(37),
                  Text(
                    'Email address',
                    style: AppTextStyles.robotoMedium13.copyWith(
                      color: AppColors.goldenYellow,
                    ),
                  ),
                  const Gap(7),
                  CustomTextField(
                    onSaved: (data) {
                      email = data;
                    },
                    hintColor: AppColors.greydark,
                    outlineInputBorderColor: AppColors.goldenYellow,
                    fillColor: AppColors.greyScale50,
                    hint: "E-mail address",
                    suffixWidget: const Icon(
                      Icons.email_rounded,
                      color: AppColors.goldenYellow,
                    ),
                    onValidate: (value) {
                      return ValidatorsErrors.validateEmail(value!);
                    },
                  ),
                  const Gap(20),
                  Text(
                    'Password',
                    style: AppTextStyles.robotoMedium13.copyWith(
                      color: AppColors.goldenYellow,
                    ),
                  ),
                  const Gap(7),
                  CustomTextField(
                    onSaved: (data) {
                      password = data;
                    },
                    hintColor: AppColors.greydark,
                    fillColor: AppColors.greyScale50,
                    hint: "Enter your password",
                    isPassword: true,
                    maxLines: 1,
                    iconColor: AppColors.goldenYellow,
                    outlineInputBorderColor: AppColors.goldenYellow,
                    onValidate: (value) {
                      return ValidatorsErrors.validatePassword(value!);
                    },
                  ),
                  const Gap(6),
                  const ForgetPassword(),
                  const Gap(34),
                  CustomButton(
                    width: 269,
                    height: 50,
                    text: 'Sign In',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<SigninCubit>().signInWithEmailAndPassword(
                              email!,
                              password!,
                            );
                      }
                    },
                  ),
                  const Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign in with',
                        style: AppTextStyles.inriaSansBold16.copyWith(
                          color: AppColors.greydark,
                        ),
                      ),
                    ],
                  ),
                  const Gap(32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleSignIn(),
                      AppleSignin(),
                      FacebookSignIn(),
                    ],
                  ),
                  const Gap(31),
                  AccountCreationPrompt(
                    onPressed: () {
                      navigatorKey.currentState
                          ?.pushReplacementNamed(PageRoutesName.signup);
                    },
                    text: 'Don\'t have an account?',
                    buttonText: 'Sign Up',
                  ),
                ],
              ).setHorizontalPadding(
                context,
                20,
                enableMediaQuery: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
