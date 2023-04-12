import 'package:flutter/material.dart';

class AppConstant {
  static const url = "https://api.themoviedb.org";
  static const apiKey = "25e3a75f3b4043840aa115c215dc3db1";
  static const imageUrl = "https://image.tmdb.org/t/p/original";

  static Color get grey => hex("#7B7B7B");
  static Color get borderColor => hex("#E0E0E0");
  static Color get hightlightColor => hex("#FAFAFA");

  static Color hex(String hex) {
    if (hex.length == 7) {
      hex = hex.toUpperCase().replaceAll("#", "");
    }
    hex = "FF$hex";

    return Color(int.parse(hex, radix: 16));
  }

  static const String logoApplication = 'assets/images/logo_application.png';
}
