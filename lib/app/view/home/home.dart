import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_now/app/helper/font_styles.dart';
import 'package:watch_now/app/view/home/now_playing_movies.dart';
import 'package:watch_now/app/view/home/popular_movie.dart';
import 'package:watch_now/app/view/home/top_rated_movie.dart';
import 'package:watch_now/app/view/home/upcoming_movie.dart';
import '../../helper/app_icons.dart';
import 'banner_movie.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Image(
              image: AppIcons.iconPopCorn,
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'Watch Now',
              style: FontStyles.headline,
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              Get.toNamed('/search_movie');
            },
          )
        ],
      ),
      body: ListView(
        children: [
          // Latest Movie Banner
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: BannerMovie(),
          ),

          // Top Rated Movie
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Top Rated Movies',
              style: FontStyles.calloutDisplay,
            ),
          ),
          const SizedBox(height: 6),
          const TopRatedMovieSection(),
          const SizedBox(height: 28),

          // Upcoming Movie
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Upcoming Movies',
              style: FontStyles.calloutDisplay,
            ),
          ),
          const SizedBox(height: 6),
          const UpcomingMovieSection(),
          const SizedBox(height: 28),

          // Now Playing Movie
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Now Playing Movies',
              style: FontStyles.calloutDisplay,
            ),
          ),
          const SizedBox(height: 6),
          const NowPlayingMovie(),
          const SizedBox(height: 28),

          // Popular Movie
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Popular Movies',
              style: FontStyles.calloutDisplay,
            ),
          ),
          const SizedBox(height: 6),
          const PopularMovieSection(),
          const SizedBox(height: 28),
          // const SizedBox(height: 10),
          // Tab Bar
          // Expanded(
          //   child: DefaultTabController(
          //     length: homeController.movieTabs.length,
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: TabBar(
          //             indicatorPadding: EdgeInsets.zero,
          //             isScrollable: true,
          //             labelColor: Colors.black,
          //             unselectedLabelColor: AppConstant.grey,
          //             labelStyle: const TextStyle(fontSize: 12),
          //             indicatorWeight: 0,
          //             indicator: BoxDecoration(
          //               border: Border.all(
          //                 color: AppConstant.borderColor,
          //               ),
          //               borderRadius: BorderRadius.circular(32),
          //               color: Colors.white,
          //             ),
          //             tabs: homeController.movieTabs,
          //           ),
          //         ),
          //         Expanded(
          //           child: TabBarView(
          //             children: [
          //               // GetBuilder<MovieController>(
          //               //   id: 'now_playing_movie',
          //               //   builder: (_) {
          //               //     return Column(
          //               //       children: List.generate(
          //               //         movieController
          //               //             .nowPlayingMovie.value.results!.length,
          //               //         (index) {
          //               //           return Padding(
          //               //             padding: const EdgeInsets.symmetric(
          //               //                 horizontal: 4),
          //               //             child: CustomCard(
          //               //               image: AppConstant.imageUrl +
          //               //                   movieController
          //               //                       .nowPlayingMovie
          //               //                       .value
          //               //                       .results![index]
          //               //                       .posterPath!,
          //               //             ),
          //               //           );
          //               //         },
          //               //       ),
          //               //     );
          //               //   },
          //               // ),
          //               Container(
          //                 child: Text("Articles Body"),
          //               ),
          //               Container(
          //                 child: Text("Articles Body"),
          //               ),
          //               Container(
          //                 child: Text("User Body"),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
