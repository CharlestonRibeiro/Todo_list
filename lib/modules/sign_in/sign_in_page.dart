import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:todo_list/core/themes/app_colors.dart';
import 'package:todo_list/core/widgets/custom_form.dart';
import 'package:todo_list/core/widgets/custom_logo.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            const CustomLogo(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: CustomForm(),
            ),
            const SizedBox(height: 20,),
            Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration:  const BoxDecoration(
              color: AppColors.grey,
              border: Border(
                top: BorderSide(
                  width: 2,
                color: AppColors.greyBolder
                )             
              )
            ),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                SignInButton(
                  Buttons.Google, 
                  text: 'Continue com o Google',
                  padding: const EdgeInsets.all(5),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none
                  ),
                  onPressed: (){}
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text('Não tem conta?'),
                      TextButton(onPressed: (){}, child: const Text('Cadastre-se'))
                    ],
                  )
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
