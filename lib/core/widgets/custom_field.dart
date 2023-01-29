import 'package:flutter/material.dart';

import 'package:todo_list/core/themes/app_colors.dart';
import 'package:todo_list/core/themes/todo_list_icons.dart';

class CustomField extends StatefulWidget {
  final String customLabel;
  final bool customObscureText;

  const CustomField({
    Key? key,
    required this.customLabel,
    this.customObscureText = false,
  }) : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: widget.customLabel,
          labelStyle: const TextStyle(fontSize: 15, color: AppColors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.red),
          ),
          isDense: true,
          suffixIcon: widget.customObscureText == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                  icon: Icon(
                      _obscure == true 
                  ? TodoListIcons.eye
                  : TodoListIcons.eye_slash,  
                    size: 15,
                  ))
              : null),

         obscureText: 
         _obscure == true 
        ? widget.customObscureText
        : false,
       

      
    );
  }
}
