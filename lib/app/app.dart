import 'package:flutter/material.dart';

import 'resource/theme_manager.dart';
import 'utils/routes_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RM',
      theme: ThemeManager.lightTheme,
      // localizationsDelegates: context.localizationDelegates,
      // locale: context.locale,
      // supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: route,
    );
  }
}
