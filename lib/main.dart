import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/screens/dashboard/dashboard_viewmodel.dart';
import 'package:music_app/screens/home_module.dart';
import 'package:music_app/screens/splash/splash_screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ModularApp(
      module: ModularRouter(),
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => DashBoardViewModel())],
        child: const MyApp(),
      )));
}

// router name
const String splashRouterName = '/';
const String homeRouterName = '/home';
const String dashboardRouterName = '/home/dash_board';
const String exploreRouterName = '/home/explore';
const String profileRouterName = '/home/profile';

// Modular navigation điều hướng
class ModularRouter extends Module {
  @override
  List<Bind> get binds => [];

  //router
  @override
  List<ModularRoute> get routes =>
      [ChildRoute(splashRouterName, child: (context, args) => const SplashScreens()), ModuleRoute(homeRouterName, module: HomeModule())];
}

// Base App
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Music app',
      debugShowCheckedModeBanner: false, // show debug
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
