import 'package:flutter/material.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';
import 'package:todo_list/src/core/themes/todo_list_icons.dart';
import 'package:todo_list/src/core/widgets/custom_drawer.dart';
import 'package:todo_list/src/core/widgets/custom_filters.dart';
import 'package:todo_list/src/core/widgets/custom_header.dart';
import 'package:todo_list/src/core/widgets/custom_card_task.dart';
import 'package:todo_list/src/core/widgets/custom_week_filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.black),
          backgroundColor: AppColors.white,
          elevation: 0,
          actions: [
            PopupMenuButton(
              icon: const Icon(TodoListIcons.filter),
              itemBuilder: (_) => [
                const PopupMenuItem<bool>(
                    child: Text('Mostrar tarefas concluidas'))
              ],
            )
          ],
        ),
        drawer: customDrawer(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:  BoxConstraints(
                  maxHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CustomHeader(),
                          CustomFilters(),
                          CustomWeekFilter(),
                          CustomCardTask(),
                          SizedBox(height: 30,)
                        ],
                      ),
                      ),
                  ),
                )
              ),
            );
          },
        ));
  }

 
}
