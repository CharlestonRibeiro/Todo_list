
import 'package:flutter/material.dart';
import 'package:todo_list/src/core/widgets/custom_field.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const CustomField(
          customLabel: 'E-mail'
          ),
        const SizedBox(
          height: 20,
        ),
        const CustomField(
          customLabel: 'Senha',
          customObscureText: true,
          ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {},
                child: const Text('esqueceu sua senha?')),
            ElevatedButton(onPressed: () {}, child: const Text('Login'))
          ],
        )
      ],
    ));
  }
}
