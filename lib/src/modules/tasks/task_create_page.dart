import 'package:flutter/material.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';
import 'package:todo_list/src/core/widgets/custom_app_bar.dart';
import 'package:todo_list/src/core/widgets/custom_calendar_button.dart';
import 'package:todo_list/src/core/widgets/custom_field.dart';

class TaskCreatePage extends StatelessWidget {
  const TaskCreatePage({super.key});

  static const route = '/task_create_page';

  @override
  Widget build(BuildContext context) {
    // final taskCreateController = context.read<TaskCreateController>();

    return Scaffold(
      appBar: customAppBar(
          context: context, customIcon: true, subTitle: 'Adicionar Tasks'),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text(
            'Salvar Task',
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          )),
      body: Form(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Align(
              alignment: Alignment.center,
              child: Text(
                'CRIAR ATIVIDADE',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyBolder),
              ),
            ),
            SizedBox( height: 30,),
            CustomField(customLabel: ''),
            SizedBox( height: 30,),
            CustomCalendarButton(),

          ],
        ),
      )),
    );
  }
}
