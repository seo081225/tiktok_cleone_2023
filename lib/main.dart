import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/firebase_options.dart';
import 'package:tiktok_clone_2023/generated/l10n.dart';
import 'package:tiktok_clone_2023/router.dart';
import 'package:tiktok_clone_2023/threads/repositories/setting_repository.dart';
import 'package:tiktok_clone_2023/threads/view_models/setting_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  final repository = SettingRepository(sharedPreferences);

  runApp(
    ProviderScope(
      overrides: [
        settingProvider.overrideWith(() => SettingViewModel(repository)),
      ],
      child: const ThreadsApp(),
    ),
  );
}

class ThreadsApp extends ConsumerStatefulWidget {
  const ThreadsApp({super.key});

  @override
  ThreadsAppState createState() => ThreadsAppState();
}

class ThreadsAppState extends ConsumerState<ThreadsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'Flutter_Threads',
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      themeMode: ref.watch(settingProvider).darkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: Typography.blackMountainView,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
        splashColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size18,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.grey.shade900,
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        primaryColor: Colors.black,
      ),
    );
  }
}
