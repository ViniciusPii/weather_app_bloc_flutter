import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app_bloc_flutter/src/core/infra/navigator/app_navigator.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_extension.dart';
import 'package:weather_app_bloc_flutter/src/core/theme/app_theme.dart';
import 'package:weather_app_bloc_flutter/src/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppExtension.background,
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: Routes().routes,
        theme: AppTheme.defaultTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: AppNavigator.navigatorKey,
      ),
    );
  }
}
