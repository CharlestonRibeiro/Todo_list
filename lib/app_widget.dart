import 'package:flutter/material.dart';
import 'package:todo_list/src/modules/home/home_page.dart';
import 'package:todo_list/src/modules/auth/recover_password/recover_password_page.dart';
import 'package:todo_list/src/modules/auth/sign_in/sign_in_page.dart';
import 'package:todo_list/src/modules/auth/sign_up/sign_up_page.dart';
import 'package:todo_list/src/modules/splash/splash_page.dart';
import 'package:todo_list/src/modules/tasks/task_create_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
     

      initialRoute: SplashPage.route,
         
      routes: {
        SplashPage.route: (_) => const SplashPage(),
        SignInPage.route: (_) => const SignInPage(),
        SignUpPage.route: (_) => const SignUpPage(),
        RecoverPasswordPage.route: (_) => const RecoverPasswordPage(),
        HomePage.route: (_) => const HomePage(),
        TaskCreatePage.route: (_) => const TaskCreatePage(),
      },
    );
  }
}
