import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // First screen shown when the app loads
      initialRoute: '/',

      // Define your pages here
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}
