import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:watch_now/app/constants/routes.dart';
import 'package:watch_now/app/services/binding_initial.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WatchNow',
          builder: (context, widget) {
            ScreenUtil();
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(color: Colors.black),
              centerTitle: true,
            ),
          ),
          getPages: AppRoutes.routes,
          initialRoute: '/home',
          initialBinding: BindingInit(),
        );
      },
    );
  }
}
