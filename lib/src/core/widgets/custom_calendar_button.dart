import 'package:flutter/material.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';

class CustomCalendarButton extends StatelessWidget {
  const CustomCalendarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyBolder,
        ),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.today, color: AppColors.greyBolder,),
          SizedBox(width: 10,),
          Text('SELECIONE UMA DATA', style: TextStyle(color: AppColors.greyBolder),)
        ],
      ),
    );
  }
}
