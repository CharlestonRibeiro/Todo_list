import 'package:flutter/material.dart';
import 'package:todo_list/core/themes/app_colors.dart';
import 'package:todo_list/core/themes/app_images.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.logo,
            height: MediaQuery.of(context).size.height * 0.25),
        //COMPONETIZAR TEMAS 
        const Text("Todo List",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.black
                )),
      ],
    );
  }
}
