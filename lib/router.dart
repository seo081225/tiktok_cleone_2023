import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone_2023/threads/repositories/authentication_repository.dart';
import 'package:tiktok_clone_2023/threads/views/login_screen.dart';
import 'package:tiktok_clone_2023/threads/views/main_navigation_screen.dart';
import 'package:tiktok_clone_2023/threads/views/privacy_screen.dart';
import 'package:tiktok_clone_2023/threads/views/settings_screen.dart';
import 'package:tiktok_clone_2023/threads/views/sign_up_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.subloc != SignUpScreen.routeURL &&
            state.subloc != LoginScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/:tab(home|search|post|activity|profile)",
        builder: (context, state) {
          final tab = state.params["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),
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
    ],
  );
});
