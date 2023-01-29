import 'package:flutter/material.dart';
import 'package:todo_list/core/widgets/custom_logo.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     // appBar: AppBar(title: const Center(child: Text('SignIn')),),
      body: Center(child: CustomLogo()),
    );
  }
}