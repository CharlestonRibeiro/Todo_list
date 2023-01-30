import 'package:flutter/material.dart';
import 'package:todo_list/modules/sign_in/sign_in_page.dart';
import 'package:todo_list/modules/sign_up/sign_up_page.dart';
import 'package:todo_list/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      home: const SignInPage(),
      routes: {
        SplashPage.route: (_) => const SplashPage(),
        SignInPage.route: (_) => const SignInPage(),
        SignUpPage.route: (_) => const SignUpPage(),
      },
    );
  }
}
