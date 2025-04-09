import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_app_hackthon/core/resources/colors.dart';
import 'package:yalla_app_hackthon/core/routing/app_router.dart';
import 'package:yalla_app_hackthon/core/routing/routes.dart';

class YallaApp extends StatelessWidget {
  final AppRouters appRouter;
  const YallaApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            primaryColor: ColorsManger.primaryColor,
            scaffoldBackgroundColor: ColorsManger.bgColor),
        initialRoute: Routes.welcomeScreen,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
