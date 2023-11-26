import 'package:flutter_modular/flutter_modular.dart';
import 'package:music_app/screens/dashboard/dashboard_screens.dart';
import 'package:music_app/screens/explore/explore_screens.dart';
import 'package:music_app/screens/profile/profile_screens.dart';
import '../bottom_navigation.dart';

class HomeModule extends Module {
  @override
  // TODO: implement binds
  List<Bind> get binds => [];
  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => BottomHomeNavigator()),
        ChildRoute('/dash_board', child: (context, args) => const DashboardScreens()),
        ChildRoute('/explore', child: (context, args) => const ExploreScreens()),
        ChildRoute('/profile', child: (context, args) => const ProfileScreens()),
      ];
}
