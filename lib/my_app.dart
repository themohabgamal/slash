import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/routing/app_router.dart';
import 'package:slash/core/routing/routes.dart';
import 'package:slash/core/theme/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Root App Widget
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Slash',
        theme: MyTheme.darkTheme,
        initialRoute: Routes.initial,
        // handle all routes in a separate file using onGenerateRoute
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
