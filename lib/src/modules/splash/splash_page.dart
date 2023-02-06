import 'package:flutter/material.dart';
import 'package:todo_list/src/core/widgets/custom_logo.dart';
import 'package:todo_list/src/modules/home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  


  static const route = '/splash_page';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacementNamed(HomePage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomLogo(),
      ),
    );
  }
}