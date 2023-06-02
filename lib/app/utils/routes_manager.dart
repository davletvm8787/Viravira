import 'package:assarickym/presentation/location/view/location_mobile_view.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/characters/view/characters_page.dart';

class Routes {
  Routes._();

  static const String locationRoute = "/Location";
  static const String characterRoute = "/Character";
  static const String characterDetailRoute = "/CharacterDetail";
  static const String episodeRoute = "/Episode";
}

final GoRouter route = GoRouter(
  initialLocation: Routes.locationRoute,
  routes: [
    GoRoute(
      path: Routes.locationRoute,
      name: Routes.locationRoute,
      builder: (context, state) => const LocationMobilePage(),
    ),
    GoRoute(
      path: Routes.characterRoute,
      name: Routes.characterRoute,
      builder: (context, state) => const CharactersPage(),
    ),
  ],
);
