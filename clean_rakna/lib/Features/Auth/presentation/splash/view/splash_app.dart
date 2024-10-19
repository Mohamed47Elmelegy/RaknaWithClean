import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../../core/routes/routes/page_routes_name.dart';
import '../../../../../core/theme/text_theme.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigateBasedOnUserStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B2B2B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(Assets.imagesSignInlogo),
          const Gap(20),
          Text(
            'Where Innovation Parks Safely',
            textAlign: TextAlign.center,
            style: AppTextStyles.caveatRegular.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void navigateBasedOnUserStatus() {
    // bool isOnBordingViewSeen = Prefs.getBool(SharedPrefs.hasSeenOnboarding);
    // var isLoggedIn = FirbaseAuthService().isLoggedIn();
    // bool isLoggedIn = Prefs.getBool(SharedPrefs.isLoggedIn);
    Future.delayed(
      const Duration(seconds: 4),
      () {
        navigatorKey.currentState?.pushReplacementNamed(PageRoutesName.signin);
        // if (isOnBordingViewSeen) {
        // if (isLoggedIn) {
        //   // Navigate to Home page if the user is logged in
        //   navigatorKey.currentState
        //       ?.pushReplacementNamed(PageRoutesName.dashBoard);
        // } else {
        //   // Navigate to Login page if the user is not logged in
        //   navigatorKey.currentState
        //       ?.pushReplacementNamed(PageRoutesName.signin);
        // }
        // } else {
        //   // Navigate to Onboarding page if the user hasn't seen it
        //   navigatorKey.currentState
        //       ?.pushReplacementNamed(PageRoutesName.onBording);
        // }
      },
    );
  }
}
