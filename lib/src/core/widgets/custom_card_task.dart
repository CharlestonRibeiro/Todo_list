import 'package:flutter/material.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';
import 'package:todo_list/src/core/widgets/custom_card_elements_task.dart';

class CustomCardTask extends StatelessWidget {
  const CustomCardTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children:  [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "TASK'S DE HOJE",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.greyBolder),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: const [
              CustomCardElementsTask(),
              CustomCardElementsTask(),
              CustomCardElementsTask(),
            ],
          ),
        ],
      ),
    );
  }
}
