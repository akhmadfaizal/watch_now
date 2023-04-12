import 'package:get/get.dart';
import 'package:watch_now/app/controllers/home_controller.dart';
import 'package:watch_now/app/controllers/movie_controller.dart';

class BindingInit extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(MovieController(), permanent: true);
  }
}
