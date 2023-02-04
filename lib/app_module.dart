import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app_widget.dart';
import 'package:todo_list/src/modules/sign_up/sign_up_controller.dart';
import 'package:todo_list/src/repositories/auth_repository.dart';
import 'package:todo_list/src/services/auth_service.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => FirebaseAuth.instance,
        ),
        Provider<AuthService>(
            create: (context) => AuthRepository(FirebaseAuth.instance)),
        Provider(
            create: (context) => SignUpController(context.read<AuthService>())),    
      ],
      child: const AppWidget(),
    );
  }
}
