import 'package:clean_rakna/core/extensions/padding_ext.dart';
import 'package:clean_rakna/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../../core/errors/validators_erros.dart';
import '../../../../../core/routes/routes/page_routes_name.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../../../../../core/theme/colors_theme.dart';
import '../../../../../core/theme/text_theme.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/account_creation_prompt.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../main.dart';
import '../manager/signup_cubit.dart';
import 'terms_and_conditions_checkbox.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}
class _SignUpViewBodyState extends State<SignUpViewBody> {
  late bool isTermsAccept = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var plateNumberController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, password, email, phoneNumber, plateNumber;
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
              child: SvgPicture.asset(Assets.imagesSignUpLogo),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(160),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: AppTextStyles.agencyFBBold48
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "create an account to continue!",
                        style: AppTextStyles.actorRegular20.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Gap(37),
                  Text(
                    'Full Name',
                    style: AppTextStyles.robotoMedium13.copyWith(
                      color: AppColors.goldenYellow,
                    ),
                  ),
                  const Gap(7),
                  CustomTextField(
                    onSaved: (value) {
                      name = value!;
                    },
                    hintColor: AppColors.greydark,
                    outlineInputBorderColor: AppColors.goldenYellow,
                    fillColor: AppColors.greyScale50,
                    hint: "Enter your name",
                    suffixWidget: const Icon(
                      Icons.person_rounded,
                      color: AppColors.goldenYellow,
                    ),
                    onValidate: (value) {
                      return ValidatorsErrors.validateFullName(value!);
                    },
                  ),
                  const Gap(20),
                  Text(
                    'Email address',
                    style: AppTextStyles.robotoMedium13.copyWith(
                      color: AppColors.goldenYellow,
                    ),
                  ),
                  const Gap(7),
                  CustomTextField(
                    onSaved: (value) {
                      email = value!;
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
                    onSaved: (value) {
                      password = value!;
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
                  const Gap(23),
                  TermsAndConditionsCheckbox(
                    onChanged: (value) {
                      isTermsAccept = value;
                      setState(() {});
                    },
                  ),
                  const Gap(34),
                  CustomButton(
                    width: 269,
                    height: 50,
                    text: 'Sign Up',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (isTermsAccept) {
                          context
                              .read<SignupCubit>()
                              .createUserWithEmailAndPassword(
                                name,
                                email,
                                password,
                              );
                        } else {
                          SnackBarService.showErrorMessage(
                              'Please accept terms and conditions');
                        }
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                  const Gap(25),
                  AccountCreationPrompt(
                    onPressed: () {
                      navigatorKey.currentState
                          ?.pushReplacementNamed(PageRoutesName.signin);
                    },
                    text: 'Already have an account?',
                    buttonText: 'Sign In',
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
