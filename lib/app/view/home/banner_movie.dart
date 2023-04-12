import 'package:flutter/material.dart';

import '../../widgets/image_url.dart';

class BannerMovie extends StatelessWidget {
  const BannerMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      height: 210,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: const [
          ImageUrl(
            url:
                "https://img.freepik.com/free-vector/night-horror-movies-flyers-with-funny-monsters_107791-14808.jpg",
            height: 210,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
