import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:yalla_app_hackthon/core/routing/app_router.dart';
import 'package:yalla_app_hackthon/yalla_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();
  await initializeDateFormatting('ar', null);

  runApp(YallaApp(
    appRouter: AppRouters(),
  ));
}
