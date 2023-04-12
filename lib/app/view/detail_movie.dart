import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_now/app/constants/app_constant.dart';
import 'package:watch_now/app/controllers/movie_controller.dart';
import 'package:watch_now/app/helper/font_styles.dart';
import 'package:watch_now/app/helper/loading.dart';
import 'package:watch_now/app/widgets/rating.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find();
    var id = 0;

    return Scaffold(
      body: GetBuilder<MovieController>(
        id: 'detail_movie',
        initState: (_) async {
          id = Get.arguments;
          await movieController.getDetailMovie(id: id);
        },
        builder: (controller) {
          if (controller.isLoading.value) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: LoadingApp.getSearchLoadingScreen(context),
            );
          }
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  Image(
                    height: 420,
                    width: Get.width,
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstant.imageUrl +
                        movieController.detailMovie.value.posterPath!),
                  ),
                  Positioned(
                    left: 12,
                    top: MediaQuery.of(context).padding.top + 20,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.chevron_left_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 200,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withAlpha(220),
                            Colors.black.withAlpha(180),
                            Colors.black.withAlpha(160),
                            Colors.black.withAlpha(140),
                            Colors.transparent
                          ],
                          stops: const [0.1, 0.25, 0.5, 0.7, 1],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    right: 20,
                    bottom: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Available Now',
                                style: FontStyles.captionDisplayMedium
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Watch ${movieController.detailMovie.value.originalTitle!}',
                                style: FontStyles.calloutDisplay.copyWith(
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Rating(
                                size: 16,
                                spacing: 4,
                                activeColor: Colors.white,
                                inactiveColor: Colors.white.withAlpha(100),
                                inactiveStarFilled: true,
                                showInactive: true,
                                // rating: controller.movie.ratings,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
                child: Text(
                  'The Plot',
                  style: FontStyles.calloutTextReguler,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  movieController.detailMovie.value.overview!,
                  style: FontStyles.paragraph,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
