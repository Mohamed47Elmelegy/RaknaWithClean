import 'package:clean_rakna/Features/Auth/presentation/DashBord/widgets/home_mune.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/colors_theme.dart';
import '../widgets/custom_home_appbar.dart';
import '../widgets/dashboard_view_body.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomHomeAppbar(),
      drawer: HomeMenuDrawer(),
      backgroundColor: AppColors.greyScale50,
      body: DashboardViewBody(),
    );
  }
}
