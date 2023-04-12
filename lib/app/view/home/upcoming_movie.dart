import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_now/app/controllers/movie_controller.dart';
import 'package:watch_now/app/helper/font_styles.dart';

import '../../constants/app_constant.dart';
import '../../widgets/rating.dart';
import '../../widgets/shimmer.dart';

class UpcomingMovieSection extends StatelessWidget {
  const UpcomingMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find();
    return GetBuilder<MovieController>(
      id: 'upcoming_movie',
      builder: (_) {
        if (movieController.upcomingMovie.value.results != null) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: listUpcomingMovie(movieController),
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

  List<Widget> listUpcomingMovie(MovieController movieController) {
    return List.generate(
      movieController.upcomingMovie.value.results!.length,
      (index) {
        final id = movieController.upcomingMovie.value.results![index].id;
        final title = movieController.upcomingMovie.value.results![index].title;
        final rating = movieController
            .upcomingMovie.value.results![index].voteAverage
            .toString();
        final posterPath =
            movieController.upcomingMovie.value.results![index].posterPath ??
                "";
        final voteCount = movieController
            .upcomingMovie.value.results![index].voteCount
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
