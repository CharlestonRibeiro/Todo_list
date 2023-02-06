import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/src/core/utils/custom_form_validator.dart';
import 'package:todo_list/src/core/widgets/custom_app_bar.dart';
import 'package:todo_list/src/core/widgets/custom_auth_dialog.dart';
import 'package:todo_list/src/core/widgets/custom_field.dart';
import 'package:todo_list/src/core/widgets/custom_logo.dart';
import 'package:todo_list/src/modules/auth/recover_password/recover_password_controller.dart';
import 'package:todo_list/src/modules/auth/recover_password/recover_password_state.dart';
import 'package:todo_list/src/modules/auth/sign_in/sign_in_page.dart';

import '../../../core/themes/app_colors.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  static const route = '/recover_password_page';

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RecoverPasswordController>();

    return  BlocListener<RecoverPasswordController, RecoverPasswordState>(
      listener: (context, state) {
        if (state is RecoverPasswordLoadingState) {
          const Center(child: CircularProgressIndicator());
        } else if (state is RecoverPasswordErrorState) {
          final error = (state).message;
          customAuthDialog(
              context, error, 'Tentar novamente', RecoverPasswordPage.route);
        } else if (state is RecoverPasswordSuccessState) {
           customAuthDialog(
              context, controller.infoMessage, 'Sucesso', SignInPage.route);

        }
      },
      child: Scaffold(
          appBar: customAppBar(context, 'Recuperar senha'),
          body: Center(
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    final valid = _formKey.currentState != null &&
                                        _formKey.currentState!.validate();
    
                                    if (valid) {
                                      controller.forgotPassword(
                                          email: _emailController.text);
                                    } else {
                                      log('ERROR ao logar');
                                    }
                                  },
                                  child: const Text('Recuperar'))
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
                ),
              ],
            )),
          )),
    );
  }
}
