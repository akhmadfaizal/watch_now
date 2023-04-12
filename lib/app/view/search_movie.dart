import 'package:flutter/material.dart';
import 'package:watch_now/app/constants/app_constant.dart';
import 'package:watch_now/app/controllers/movie_controller.dart';
import 'package:watch_now/app/helper/loading.dart';
import 'package:watch_now/app/widgets/image_url.dart';
import 'package:get/get.dart';

class SearchMovie extends StatelessWidget {
  const SearchMovie({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchMovieController = TextEditingController();

    return GetBuilder<MovieController>(
        id: 'search_movie',
        dispose: (state) {
          state.controller!.resultSearchMovie.clear();
        },
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchMovieController,
                          decoration: InputDecoration(
                            hintText: 'Search Movie',
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppConstant.borderColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppConstant.grey),
                            ),
                          ),
                          onChanged: (query) {
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () async {
                                await controller.getSearchMovie(query: query);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      children: [
                        if (searchMovieController.text.isNotEmpty &&
                            controller.resultSearchMovie.isNotEmpty) ...[
                          ...List.generate(
                            controller.resultSearchMovie.length,
                            (index) {
                              final id = controller.resultSearchMovie[index].id;
                              final title =
                                  controller.resultSearchMovie[index].title;
                              final posterPath = controller
                                  .resultSearchMovie[index].posterPath;
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed('/detail_movie', arguments: id);
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  height: 80,
                                  child: Row(
                                    children: [
                                      ImageUrl(
                                        url: posterPath != null
                                            ? AppConstant.imageUrl + posterPath
                                            : "",
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Flexible(child: Text(title.toString())),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ] else if (controller.isLoading.value &&
                            searchMovieController.text.isNotEmpty) ...[
                          LoadingApp.getSearchLoadingScreen(context),
                        ] else ...[
                          const Text('Find your favorite movie')
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
