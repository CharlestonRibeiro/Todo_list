import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';

class CustomWeekFilter extends StatelessWidget {
  const CustomWeekFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const SizedBox(height: 20,),
        const Text('DIA DA SEMANA',
        style: TextStyle(
              fontSize: 20,
              fontWeight:FontWeight.bold,
              color: AppColors.greyBolder
          ),
        ),
        const SizedBox(height: 20,),
        SizedBox(
          height: 95,
          child: DatePicker(
            DateTime.now(),
            locale: 'pt-BR',
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColors.blue,
            daysCount: 7,
            monthTextStyle: const TextStyle(fontSize: 13),
            dayTextStyle: const TextStyle(fontSize: 13),
            dateTextStyle: const TextStyle(fontSize: 13),
          ),
        )
      ],
    );
  }
}