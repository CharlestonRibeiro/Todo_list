import 'package:flutter/material.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';

AppBar customAppBar(BuildContext context, String subTitle) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.white,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const Text('Todo List',
            style: TextStyle(fontSize: 15, color: AppColors.black)),
        Text( subTitle,
            style: const TextStyle(fontSize: 20, color: AppColors.black)),
      ],
    ),
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: ClipOval(
        child: Container(
          color: AppColors.greyBolder,
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
            color: AppColors.grey,
          ),
        ),
      ),
    ),
  );
}
