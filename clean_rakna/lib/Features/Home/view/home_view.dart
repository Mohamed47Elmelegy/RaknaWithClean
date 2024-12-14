import 'package:clean_rakna/Features/Home/widgets/home_mune.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/colors_theme.dart';
import '../widgets/custom_home_appbar.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomHomeAppbar(),
      drawer: HomeMenuDrawer(),
      backgroundColor: AppColors.primaryColor,
      body: HomeViewBody(),
    );
  }
}
