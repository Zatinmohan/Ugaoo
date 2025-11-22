import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ugaoo/core/global_di/app_di.dart';
import 'package:ugaoo/core/router/manager/router_manager.dart';
import 'package:ugaoo/modules/app_core/localisation/localisation.dart';
import 'package:ugaoo/modules/app_core/theme/chlorophyll_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppDependencyInjection().registerCoreDependencies(appFlavor);
  await sl.get<LocalisationHandler>().initilise();

  runApp(
    EasyLocalization(
      supportedLocales: sl.get<LocalisationHandler>().supportedLocale,
      path: sl.get<LocalisationHandler>().translationPath,
      fallbackLocale: sl<LocalisationHandler>().supportedLocale.first,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil(
      options: const ScreenUtilOptions(
        designSize: Size(375, 812),
      ),
      child: MaterialApp.router(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        title: 'Ugaoo',
        theme: ChlorophyllCore().lightTheme,
        darkTheme: ChlorophyllCore().darkTheme,
        routerConfig: sl.get<RouterManager>().routerConfig,
      ),
    );
  }
}
