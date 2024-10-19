import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/config/constants.dart';
import '../../../../../core/theme/colors_theme.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5A5A5A),
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(100),
      //   child: CustomAppBar(),
      // ),
      // drawer: const MenuDrawer(),
      body: Column(
        children: [
          Container(
            width: Constants.mediaQuery.width,
            color: AppColors.primaryColor,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 22,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Book your place !',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: Color(0xffF8A00E),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: Constants.mediaQuery.width * 0.88,
                  height: Constants.mediaQuery.height * 0.28,
                  // child: Image.asset(
                  //   'assets/images/frame425.png',
                  //   fit: BoxFit.fill,
                  // ),
                ),
                const Gap(20),
                Container(
                  width: Constants.mediaQuery.width * 1,
                  height: Constants.mediaQuery.height * 0.4,
                  decoration: const BoxDecoration(
                    color: Color(0xff5B5B5B),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "0", // Placeholder for free slots number
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                            Gap(10),
                            Text(
                              "Free Slot",
                              style: TextStyle(
                                fontSize: 28,
                                color: Color(0xffF8A00E),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 500,
                        // child: Image.asset("assets/images/Group 36681.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
