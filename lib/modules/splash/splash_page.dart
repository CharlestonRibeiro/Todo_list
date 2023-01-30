import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const route = '/splash_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Center(child: Text('Splash page')),),
    );
  }
}