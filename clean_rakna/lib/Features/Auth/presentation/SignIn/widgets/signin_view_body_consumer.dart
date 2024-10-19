import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/prefs.dart';
import '../../../../../core/routes/routes/page_routes_name.dart';
import '../../../../../core/services/shared_preferences_sengltion.dart';
import '../../../../../core/widgets/model_progress_hud.dart';
import '../../../../../main.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../manager/signin_cubit.dart';
import 'signin_view_boyd.dart';

class SigninViewBodyConsumer extends StatelessWidget {
  const SigninViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Prefs.setBool(SharedPrefs.isLoggedIn, true); // حفظ حالة تسجيل الدخول
          navigatorKey.currentState?.pushReplacementNamed(
              PageRoutesName.dashBoard); // الانتقال إلى Home
          SnackBarService.showSuccessMessage('Sign in successfully');
        } else if (state is SigninFailure) {
          SnackBarService.showErrorMessage(state.exception);
        }
      },
      builder: (context, state) {
        return CustomModelProgressHud(
            isLoding: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
