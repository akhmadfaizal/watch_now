import 'package:flutter/material.dart';
import 'image_url.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.image,
      this.height,
      this.width,
      this.fit = BoxFit.cover});

  final String? image;
  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: ImageUrl(
          url: image,
          fit: fit,
        ),
      ),
    );
  }
}
