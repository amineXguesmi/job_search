import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_search/features/shared_features/ui/screens/signup/signup_screen.dart';
import 'package:job_search/features/shared_features/ui/screens/startup_screen.dart';
import 'features/shared_features/ui/screens/splash_screen.dart';

void main() {
  runApp(    const ProviderScope(
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOXEC',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/startup': (context) => const StartupScreen(),
        '/signup': (context) =>  const SignupScreen(),
      },
    );
  }
}
