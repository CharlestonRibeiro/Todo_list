import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';
import 'package:todo_list/src/core/utils/custom_form_validator.dart';
import 'package:todo_list/src/core/widgets/custom_auth_dialog.dart';
import 'package:todo_list/src/core/widgets/custom_field.dart';
import 'package:todo_list/src/core/widgets/custom_logo.dart';
import 'package:todo_list/src/modules/home/home_page.dart';
import 'package:todo_list/src/modules/auth/recover_password/recover_password_page.dart';
import 'package:todo_list/src/modules/auth/sign_in/sign_in_controller.dart';
import 'package:todo_list/src/modules/auth/sign_in/sign_in_state.dart';
import 'package:todo_list/src/modules/auth/sign_up/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const route = '/sign_in_page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SignInController>();

    return BlocListener<SignInController, SignInState>(
      listener: (context, state) {
        if (state is SignInLoadingState) {
          const Center(child: CircularProgressIndicator());
        } else if (state is SignInErrorState) {
          final error = (state).message;
          customAuthDialog(
              context, error, 'Tentar novamente', SignInPage.route);
        } else if (state is SignInSuccessState) {
          Navigator.of(context).pushReplacementNamed(HomePage.route);
          
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              const CustomLogo(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomField(
                          customLabel: 'E-mail',
                          customController: _emailController,
                          customValidator: CustomFormValidator.validateEmail,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomField(
                            customLabel: 'Senha',
                            customObscureText: true,
                            customController: _passwordController,
                            customValidator:
                                CustomFormValidator.validatePassword),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(RecoverPasswordPage.route);
                                },
                                child: const Text('esqueceu sua senha?')),
                            ElevatedButton(
                                onPressed: () {
                                  final valid = _formKey.currentState != null &&
                                      _formKey.currentState!.validate();

                                  if (valid) {
                                    controller.doLogin(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                  } else {
                                    log('ERROR ao logar');
                                  }
                                },
                                child: const Text('Login'))
                          ],
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: const BoxDecoration(
                    color: AppColors.grey,
                    border: Border(
                        top:
                            BorderSide(width: 2, color: AppColors.greyBolder))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não tem conta?'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(SignUpPage.route);
                            },
                            child: const Text('Cadastre-se'))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
