import 'package:flutter/material.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';
import 'package:todo_list/src/core/widgets/custom_card.dart';

class CustomFilters extends StatefulWidget {
  const CustomFilters({super.key});

  @override
  State<CustomFilters> createState() => _CustomFiltersState();
}

class _CustomFiltersState extends State<CustomFilters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const SizedBox(
          height: 20,
        ),
        const Text(
          'FILTROS',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.greyBolder),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
              CustomCard(),
            ],
          ),
        )
      ],
    );
  }
}
