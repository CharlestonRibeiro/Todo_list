import 'package:flutter/material.dart';
import 'package:todo_list/src/core/themes/app_colors.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 120,
        minWidth: 150,
      ),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      decoration:  BoxDecoration(
        color: AppColors.blue,
        border: Border.all(width: 1, color: AppColors.grey.withOpacity(.8),),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('10 TASKS',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.white,
            ),
          ),
          Text('HOJE', 
            style: TextStyle(
              fontSize: 20,
              fontWeight:FontWeight.bold,
              color: AppColors.white
          ),),

          // LinearProgressIndicator(
          //   backgroundColor:AppColors.grey,
          //   valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
          //   value: 0.4,
          // ),

          // SizedBox(
          //   height: 21,
          //   width: 21,
          //   child: CircularProgressIndicator(),
          // )
        ],
      ),
    );
  }
}
