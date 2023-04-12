import 'package:get/get.dart';
import 'package:watch_now/app/constants/app_constant.dart';
import 'package:watch_now/app/helper/http_req_handler.dart';
import 'package:watch_now/app/helper/request_handler_status.dart';
import 'package:watch_now/app/model/movie/detail_movie.dart';
import 'package:watch_now/app/model/movie/top_rated_movie.dart';

import '../model/movie/latest_movie.dart';

class MovieController extends GetxController {
  final topRatedMovie = TopRatedMovie().obs;
  final upcomingMovie = TopRatedMovie().obs;
  final nowPlayingMovie = TopRatedMovie().obs;
  final popularMovie = TopRatedMovie().obs;
  final searchMovie = TopRatedMovie().obs;
  final latestMovie = LatestMovie().obs;
  final detailMovie = DetailMovie().obs;

  Rx<RequestHandlerStatus> requestStatus = RequestHandlerStatus.none.obs;

  List<Result> resultSearchMovie = <Result>[];

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    await getTopRatedMovie();
    await getNowPlayingMovie();
    await getUpcomingMovie();
    await getPopularMovie();
    // await getLatestMovie();
    update([
      'top_rated_movie',
      'upcoming_movie',
      'now_playing_movie',
      'latest_movie'
    ]);
  }

  Future<bool> getTopRatedMovie() async {
    Uri uri = Uri.parse(
        "${AppConstant.url}/3/movie/top_rated/?api_key=${AppConstant.apiKey}&language=en-US");

    var response = await HttpRequestHandler.get(
      uri,
      isShowSuccessResponse: true,
    );

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> data = response.data;
        topRatedMovie.value = TopRatedMovie.fromJson(data);

        return true;
      default:
        return false;
    }
  }

  Future<bool> getUpcomingMovie() async {
    Uri uri = Uri.parse(
        "${AppConstant.url}/3/movie/upcoming/?api_key=${AppConstant.apiKey}&language=en-US");

    var response = await HttpRequestHandler.get(
      uri,
      isShowSuccessResponse: true,
    );

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> data = response.data;
        upcomingMovie.value = TopRatedMovie.fromJson(data);

        return true;
      default:
        return false;
    }
  }

  Future<bool> getNowPlayingMovie() async {
    Uri uri = Uri.parse(
        "${AppConstant.url}/3/movie/now_playing/?api_key=${AppConstant.apiKey}&language=en-US");

    var response = await HttpRequestHandler.get(
      uri,
      isShowSuccessResponse: true,
    );

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> data = response.data;
        nowPlayingMovie.value = TopRatedMovie.fromJson(data);

        return true;
      default:
        return false;
    }
  }

  Future<bool> getPopularMovie() async {
    Uri uri = Uri.parse(
        "${AppConstant.url}/3/movie/popular/?api_key=${AppConstant.apiKey}&language=en-US");

    var response = await HttpRequestHandler.get(
      uri,
      isShowSuccessResponse: true,
    );

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> data = response.data;
        popularMovie.value = TopRatedMovie.fromJson(data);

        return true;
      default:
        return false;
    }
  }

  Future<bool> getSearchMovie({String? query}) async {
    resultSearchMovie.clear();
    isLoading(true);
    update(['search_movie']);
    Uri uri = Uri.parse(
        "${AppConstant.url}/3/search/movie?api_key=${AppConstant.apiKey}&language=en-US&query=$query");

    var response = await HttpRequestHandler.get(
      uri,
      isShowSuccessResponse: true,
    );

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> data = response.data;
        searchMovie.value = TopRatedMovie.fromJson(data);

        resultSearchMovie.addAll(searchMovie.value.results as Iterable<Result>);

        isLoading(false);
        update(['search_movie']);

        return true;
      default:
        return false;
    }
  }

  Future<bool> getLatestMovie() async {
    Uri uri = Uri.parse(
        "${AppConstant.url}/3/movie/latest?api_key=${AppConstant.apiKey}&language=en-US");

    var response = await HttpRequestHandler.get(
      uri,
      isShowSuccessResponse: true,
    );

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> data = response.data;
        latestMovie.value = LatestMovie.fromJson(data);

        return true;
      default:
        return false;
    }
  }

  Future<bool> getDetailMovie({int? id}) async {
    requestStatus(RequestHandlerStatus.loading);
    isLoading(true);
    update(['detail_movie']);
    Uri uri = Uri.parse(
        "${AppConstant.url}/3/movie/$id?api_key=${AppConstant.apiKey}&language=en-US");

    var response = await HttpRequestHandler.get(
      uri,
      isShowSuccessResponse: true,
    );

    switch (response.statusCode) {
      case 200:
        Map<String, dynamic> data = response.data;
        detailMovie.value = DetailMovie.fromJson(data);

        requestStatus(RequestHandlerStatus.success);
        isLoading(false);
        update(['detail_movie']);

        return true;
      default:
        return false;
    }
  }
}
