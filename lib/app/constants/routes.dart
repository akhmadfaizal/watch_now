import 'package:get/get.dart';
import 'package:watch_now/app/view/detail_movie.dart';
import 'package:watch_now/app/view/home/home.dart';
import 'package:watch_now/app/view/main_app.dart';
import 'package:watch_now/app/view/search_movie.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/main_app', page: () => const MainApp()),
    GetPage(name: '/home', page: () => const Home()),
    GetPage(name: '/search_movie', page: () => const SearchMovie()),
    GetPage(name: '/detail_movie', page: () => const DetailMovie()),
  ];
}
