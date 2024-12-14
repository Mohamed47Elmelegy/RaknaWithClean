import 'package:clean_rakna/Features/Home/widgets/map_container.dart';
import 'package:clean_rakna/core/extensions/padding_ext.dart';
import 'package:clean_rakna/core/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/widgets/custom_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 51,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child: Text(
                  'Book your place !',
                  style: AppTextStyles.interBold24.copyWith(
                    color: AppColors.goldenYellow,
                    fontSize: 25,
                  ),
                ),
              ),
              MapContainer(
                onTap: () {},
              ),
            ],
          ).setHorizontalPadding(
            context,
            22,
            enableMediaQuery: false,
          ),
          Column(
            children: [
              Container(
                width: 360.w,
                height: 400.h,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                    color: AppColors.greydark),
                child: Column(
                  spacing: 19,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          '100',
                          style: AppTextStyles.jostColor.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Free Slots',
                          style: AppTextStyles.jostColor
                              .copyWith(color: AppColors.goldenYellow),
                        )
                      ],
                    ).setVerticalPadding(context, 22, enableMediaQuery: false),
                    SizedBox(
                      width: 355.22.w,
                      height: 198.h,
                      child: Image.asset(
                        Assets.imagesStaticPark,
                        fit: BoxFit.cover,
                      ),
                    ),
                    CustomButton(
                      onTap: () {},
                      text: 'Reserve Now',
                      width: 174.w,
                      height: 39.h,
                      color: AppColors.primaryColor,
                      textColor: AppColors.greydark,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
