import 'package:auto_route/annotations.dart';
import 'package:flutter_bcsn_demo/feature/splash_screen.dart';
import 'package:flutter_bcsn_demo/feature/swap_screen.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page, Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true, path: ROUTE_SPLASH),
    AutoRoute(page: SwapScreen, path: ROUTE_SWAP_SCREEN),

  ],
)
class $AppRouter {}


const ROUTE_SPLASH = "splash_screen";
const ROUTE_SWAP_SCREEN= "swap_screen";
