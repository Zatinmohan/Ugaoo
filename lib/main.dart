import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ugaoo/core/global_di/app_di.dart';
import 'package:ugaoo/core/router/manager/router_manager.dart';
import 'package:ugaoo/modules/app_core/theme/chlorophyll_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencyInjection().registerCoreDependencies(appFlavor);

  runApp(const MyApp());
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
        title: 'Ugaoo',
        theme: ChlorophyllCore().lightTheme,
        darkTheme: ChlorophyllCore().darkTheme,
        routerConfig: sl.get<RouterManager>().routerConfig,
      ),
    );
  }
}
