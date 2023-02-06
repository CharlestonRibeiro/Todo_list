import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/src/core/utils/custom_form_validator.dart';
import 'package:todo_list/src/core/widgets/custom_app_bar.dart';
import 'package:todo_list/src/core/widgets/custom_auth_dialog.dart';
import 'package:todo_list/src/core/widgets/custom_field.dart';
import 'package:todo_list/src/core/widgets/custom_logo.dart';
import 'package:todo_list/src/modules/auth/sign_in/sign_in_page.dart';
import 'package:todo_list/src/modules/auth/sign_up/sign_up_controller.dart';
import 'package:todo_list/src/modules/auth/sign_up/sing_up_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const route = '/sign_up_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SignUpController>();

    return BlocListener<SignUpController, SignUpState>(
      listener: (context, state) {
         if (state is SignUpLoadingState) {
          const Center(child: CircularProgressIndicator());
        } else if (state is SignUpErrorState) {
           final error = (state).message;
          customAuthDialog(
              context, error, 'Tentar novamente', SignUpPage.route);
        } else if (state is SignUpSuccessState) {
          customAuthDialog(context, 'Registro realizado com sucesso!!!',
              'Entrar', SignInPage.route);
        }
      },
        child: Scaffold(
          appBar: customAppBar(context, 'Cadastro'),
          body: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * .5,
                child: const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: CustomLogo(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomField(
                        customLabel: 'Nome',
                        customController: _nameController,
                        customValidator: CustomFormValidator.validateName,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                          customValidator: CustomFormValidator.validatePassword),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomField(
                        customLabel: 'Confirma Senha',
                        customObscureText: true,
                        customValidator: (value) =>
                            CustomFormValidator.confirmValidatePassword(
                                _passwordController.text, value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                              onPressed: () {
                                final valid = _formKey.currentState != null &&
                                    _formKey.currentState!.validate();
                                if (valid) {
                                  controller.doSignUp(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text);
                                } else {
                                  log('ERROR ao logar');
                                }
                              },
                              child: const Text('Salvar')))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
