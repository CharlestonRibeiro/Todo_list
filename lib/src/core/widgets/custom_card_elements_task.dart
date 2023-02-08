import 'package:flutter/material.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';

class CustomCardElementsTask extends StatelessWidget {
  const CustomCardElementsTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: AppColors.grey)]),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          title: const Text(
            'Descrição de TASK',
            style: TextStyle(
                decoration: false ? TextDecoration.lineThrough : null,
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: AppColors.black),
          ),
          subtitle: const Text(
            '20/07/2021',
            style: TextStyle(
                decoration: false ? TextDecoration.lineThrough : null,
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: AppColors.black),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(width: 1)
          ),
        ),
      ),
    );
  }
}
