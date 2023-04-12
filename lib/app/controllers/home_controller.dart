import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Tab> movieTabs = const <Tab>[
    Tab(text: 'Now Playing Movies'),
    Tab(text: 'Popular Movies'),
    Tab(text: 'Upcoming Movies'),
  ];
}
