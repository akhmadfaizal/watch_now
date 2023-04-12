import 'package:flutter/material.dart';
import 'package:watch_now/app/helper/app_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageUrl extends StatelessWidget {
  const ImageUrl({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.color,
    this.defaultIcon,
  }) : super(key: key);

  final String? url;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final ImageProvider? defaultIcon;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorWidget: (context, url, error) => Image(
        image: defaultIcon ?? AppIcons.logoApplication,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
