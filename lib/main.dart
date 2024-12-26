import 'package:ProperGenies/utils/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:ProperGenies/utils/app_constant.dart';
import 'package:ProperGenies/view/start/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'config/generate_routes.dart';
import 'data/model/app_model.dart';
import 'di_container.dart' as di;

final appConstants = AppConstants();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await di.init();
  GetIt.I.registerSingleton<AppModel>(AppModel());
  await GetIt.I.allReady();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size designSize = const Size(393, 852);
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    if (isTablet) {
      designSize = const Size(810, 1080);
    }
    return ChangeNotifierProvider(
        create: (context) => GetIt.I.get<AppModel>(),
        child: Consumer<ThemeManager>(builder: (context, model, _) {
          return ScreenUtilInit(
              designSize: designSize,
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                final MediaQueryData data = MediaQuery.of(context);
                return MediaQuery(
                  data: data.copyWith(textScaler: const TextScaler.linear(1)),
                  child: MaterialApp(
                    theme: model.themeData,
                    debugShowCheckedModeBanner: false,
                    initialRoute: SplashScreen.route,
                    onGenerateRoute: (settings) => generateRoute(settings),
                  ),
                );
              });
        }));
  }
}
