import 'package:cloundry_care/shared/connection_lost_view.dart';
import 'package:cloundry_care/shared/network_status_service.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/constant/end_points.dart';
import 'package:cloundry_care/util/constant/extensions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/flavors/build_config.dart';
import 'app/flavors/env_config.dart';
import 'app/flavors/environment.dart';
import 'generated/locales.g.dart';
import 'util/constant/app_theme.dart';
import 'util/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late EnvConfig config;
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      translations: LanguageTranslations(),
      title: config.appName,
      builder: (context, child) {
        return StreamBuilder<ConnectivityResult>(
            stream: NetworkStatusService().networkStatusController.stream,
            builder: (context, snapshot) {
              final conenctivityResult = snapshot.data;
              if (conenctivityResult == ConnectivityResult.none) {
                return ConnectionLostView();
              }

              return child ?? Container();
            });
      },
      locale: isArabic ? arabicLocal : englishLocal,
      fallbackLocale: englishLocal,
      supportedLocales: [arabicLocal, englishLocal],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          return supportedLocale;
        }
        return supportedLocales.first;
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }

  @override
  void initState() {
    super.initState();
    config = EnvConfig(
      appName: 'Cloundry care',
      baseUrl: AppEndPoints.baseUrl,
      shouldCollectCrashLog: true,
    );

    BuildConfig.instantiate(
      envType: Environment.development,
      envConfig: config,
    );
  }
}
