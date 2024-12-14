import 'package:clean_rakna/Features/Home/widgets/custom_drower_list.dart';
import 'package:clean_rakna/core/functions/get_user.dart';
import 'package:clean_rakna/core/routes/routes/page_routes_name.dart';
import 'package:clean_rakna/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../core/config/constants.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/utils/app_images.dart';

class HomeMenuDrawer extends StatelessWidget {
  final String? userName;
  final String? userImageUrl;

  const HomeMenuDrawer({
    super.key,
    this.userName = "N/A",
    this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff5B5B5B),
      width: Constants.mediaQuery.width * 0.77,
      child: SafeArea(
        minimum: const EdgeInsets.only(top: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: userImageUrl != null
                        ? NetworkImage(userImageUrl!)
                        : const AssetImage(Assets.imagesProfilePicture)
                            as ImageProvider,
                    radius: 30,
                  ),
                  const Gap(9),
                  Text(getUser().name,
                      style: AppTextStyles.latoMedium
                          .copyWith(color: Colors.white)),
                  const Gap(12),
                  SizedBox(
                    width: 135,
                    height: 32,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        navigatorKey.currentState
                            ?.pushNamed(PageRoutesName.profile);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.imagesEdite,
                          ),
                          Text(
                            "Edit Profile",
                            style: AppTextStyles.latoMedium
                                .copyWith(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(34),
            Padding(
              padding: const EdgeInsets.only(left: 37),
              child: SizedBox(
                height: Constants.mediaQuery.height * 0.4,
                child: ListView(
                  children: const [
                    DrawerListTile(
                      icon: Assets.imagesNotifications,
                      label: "Notification",
                      routeName: "routeName",
                    ),
                    DividerWidget(),
                    DrawerListTile(
                      icon: Assets.imagesHistory,
                      label: "History",
                      routeName: "HistoryPage",
                    ),
                    DividerWidget(),
                    DrawerListTile(
                      icon: Assets.imagesHelp,
                      label: "Help",
                      routeName: "routeName",
                    ),
                    DividerWidget(),
                    DrawerListTile(
                      icon: Assets.imagesReports,
                      label: "Reports",
                      routeName: 'routeName',
                    ),
                    DividerWidget(),
                    DrawerListTile(
                      icon: Assets.imagesLogOut,
                      label: "Log Out",
                      routeName: PageRoutesName.signin,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
