import 'package:flutter/material.dart';
import '../../../core/utils/app_images.dart';

class MapContainer extends StatelessWidget {
  const MapContainer({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 316 / 179,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Image.asset(
            Assets.imagesMap,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
