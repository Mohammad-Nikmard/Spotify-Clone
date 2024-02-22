import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/ui/dashboard_screen.dart';
import 'package:spotify_clone/ui/home_screen.dart';
import 'package:spotify_clone/ui/library_screen.dart';
import 'package:spotify_clone/ui/search_category_screen.dart';
import 'package:spotify_clone/ui/search_screen.dart';
import 'package:spotify_clone/ui/setting_screen.dart';

class AppNavigation {
  AppNavigation._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: "shellHome");
  static final _rootNavigatorsearch =
      GlobalKey<NavigatorState>(debugLabel: "shellSearch");
  static final _rootNavigatorLibrary =
      GlobalKey<NavigatorState>(debugLabel: "shellLibrary");

  static String initR = "/home";

  static final GoRouter router = GoRouter(
    initialLocation: initR,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashBoardScreen(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _rootNavigatorHome,
            routes: [
              GoRoute(
                path: '/home',
                name: 'Home',
                builder: (context, state) {
                  return HomeScreen(
                    key: state.pageKey,
                  );
                },
                routes: [
                  GoRoute(
                    path: "setting",
                    name: "Setting",
                    builder: (context, state) {
                      return SettingScreen(
                        key: state.pageKey,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorsearch,
            routes: [
              GoRoute(
                path: '/searchCategory',
                name: 'SearchCategory',
                builder: (context, state) {
                  return SearchCategoryScreen(
                    key: state.pageKey,
                  );
                },
                routes: [
                  GoRoute(
                    path: "search",
                    name: "Search",
                    builder: (context, state) {
                      return SearchScreen(
                        key: state.pageKey,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootNavigatorLibrary,
            routes: [
              GoRoute(
                path: '/library',
                name: 'Library',
                builder: (context, state) {
                  return LibraryScreen(
                    key: state.pageKey,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
