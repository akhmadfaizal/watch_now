import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_now/app/controllers/movie_controller.dart';
import 'package:watch_now/app/helper/font_styles.dart';

import '../../constants/app_constant.dart';
import '../../widgets/rating.dart';
import '../../widgets/shimmer.dart';

class PopularMovieSection extends StatelessWidget {
  const PopularMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find();
    return GetBuilder<MovieController>(
      id: 'now_playing_movie',
      builder: (_) {
        if (movieController.popularMovie.value.results != null) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: listPopularMovie(movieController),
              ),
            ),
          );
        }
        return SizedBox(
          height: 300,
          width: Get.width,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: ShimmerBox(
                  height: 300,
                  width: 200,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> listPopularMovie(MovieController movieController) {
    return List.generate(
      movieController.popularMovie.value.results!.length,
      (index) {
        final id = movieController.popularMovie.value.results![index].id;
        final title = movieController.popularMovie.value.results![index].title;
        final rating = movieController
            .popularMovie.value.results![index].voteAverage
            .toString();
        final posterPath =
            movieController.popularMovie.value.results![index].posterPath ?? "";
        final voteCount = movieController
            .popularMovie.value.results![index].voteCount
            .toString();
        return GestureDetector(
          onTap: () {
            Get.toNamed('/detail_movie', arguments: id);
          },
          child: Container(
            width: 120,
            margin: const EdgeInsets.only(right: 10),
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    height: 150,
                    width: 120,
                    fit: BoxFit.fill,
                    image: NetworkImage(AppConstant.imageUrl + posterPath),
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  child: Text(
                    title ?? "",
                    style: FontStyles.captionTextBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Rating(
                      rating: 1,
                      size: 24,
                      activeColor: Colors.black,
                      showInactive: false,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: [
                            Text(
                              rating,
                              style: FontStyles.calloutDisplay,
                            ),
                            Text(
                              '/10',
                              style: FontStyles.smallText,
                            )
                          ],
                        ),
                        const SizedBox(height: 1),
                        Text(
                          voteCount,
                          style: FontStyles.smallText,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
