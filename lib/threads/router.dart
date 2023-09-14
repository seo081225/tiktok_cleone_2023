import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_2023/threads/activity_screen.dart';
import 'package:tiktok_clone_2023/threads/main_navigation_screen.dart';
import 'package:tiktok_clone_2023/threads/privacy_screen.dart';
import 'package:tiktok_clone_2023/threads/search_screen.dart';
import 'package:tiktok_clone_2023/threads/settings_screen.dart';
import 'package:tiktok_clone_2023/threads/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: "/",
        builder: (context, state) {
          return const MainNavigationScreen(tab: "home");
        },
        routes: [
          GoRoute(
              name: SettingsScreen.routeName,
              path: SettingsScreen.routeURL,
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                  path: PrivacyScreen.routeURL,
                  name: PrivacyScreen.routeName,
                  builder: (context, state) => const PrivacyScreen(),
                )
              ]),
        ]),
    GoRoute(
      path: "/:tab(home|search|post|activity|profile)",
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
      //),
      // routes: [
      //   GoRoute(
      //     path: "search",
      //     name: "search",
      //     builder: (context, state) => const SearchScreen(),
      //   ),
      //   GoRoute(
      //     path: "activity",
      //     builder: (context, state) => const ActivityScreen(),
      //   ),
      //   GoRoute(
      //     path: "profile",
      //     builder: (context, state) => const UserProfileScreen(),
      //   ),

      // ]

      // path: MainNavigationScreen.routeURL,
      // name: MainNavigationScreen.routeName,
      // builder: (context, state) => const MainNavigationScreen(),
      // routes: [
      //   GoRoute(
      //     path: SearchScreen.routeURL,
      //     builder: (context, state) => const SearchScreen(),
      //   ),
      // ]
      // ),
      // GoRoute(
      //   path: SearchScreen.routeURL,
      //   builder: (context, state) => const SearchScreen(),

      // routes: [
      //   GoRoute(
      //     path: UsernameScreen.routeURL,
      //     name: UsernameScreen.routeName,
      //     builder: (context, state) => const UsernameScreen(),
      //     routes: [
      //       GoRoute(
      //         name: EmailScreen.routeName,
      //         path: EmailScreen.routeURL,
      //         builder: (context, state) {
      //           final args = state.extra as EmailScreenArgs;
      //           return EmailScreen(username: args.username);
      //         },
      //       ),
      //     ],
      //   ),
      // ],
      // ),
      // GoRoute(
      //   path: LoginScreen.routeName,
      //   builder: (context, state) => const LoginScreen(),
      // ),
      // GoRoute(
      //   path: UsernameScreen.routeName,
      //   builder: (context, state) => const UsernameScreen(),
      // ),
      // GoRoute(
      //   path: EmailScreen.routeName,
      //   builder: (context, state) {
      //     final args = state.extra as EmailScreenArgs;
      //     return EmailScreen(username: args.username);
      //   },
      // ),
      // GoRoute(
      //   path: "/users/:username",
      //   builder: (context, state) {
      //     final username = state.params['username'];
      //     final tab = state.queryParams["show"];
      //     return UserProfileScreen(username: username!, tab: tab!);
      //   },
    )
  ],
);
