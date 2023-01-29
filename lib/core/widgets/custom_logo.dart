import 'package:flutter/material.dart';
import 'package:todo_list/core/themes/app_colors.dart';
import 'package:todo_list/core/themes/app_images.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.logo,
            height: MediaQuery.of(context).size.height * 0.25),
        const Text(
          "Todo List",
          style: TextStyle(color: AppColors.primaryDark, fontSize: 30,),
        ),
      ],
    );
  }
}