import 'package:clean_rakna/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_images.dart';

class DrawerListTile extends StatelessWidget {
  final String icon;
  final String label;
  final String routeName;

  const DrawerListTile({
    super.key,
    required this.icon,
    required this.label,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(icon),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () => navigatorKey.currentState?.pushNamed(routeName),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.imagesDvider);
  }
}
