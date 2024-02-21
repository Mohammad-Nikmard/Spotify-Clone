import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/DI/service_locator.dart';
import 'package:spotify_clone/navigation/app_navigation.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(
            splashColor: Colors.transparent,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppNavigation.router,
        );
      },
    );
  }
}
