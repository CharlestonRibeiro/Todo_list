import 'package:flutter/cupertino.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';

extension ThemeExtension on BuildContext {
  
  TextStyle get titleStyle => const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.black
  );
}
