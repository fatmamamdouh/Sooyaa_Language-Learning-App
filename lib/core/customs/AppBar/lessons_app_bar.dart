import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class LessonsAppBar extends StatelessWidget {
  const LessonsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.close,),),
        SizedBox(width: 6.0,),
        Flexible(
          child: LinearProgressIndicator(
            minHeight: 12.0,
            borderRadius: BorderRadius.circular(100.0),
            value: .5,
            color: AppColors.primaryColor,
            backgroundColor: AppColors.fillColor,
          ),
        ),
        SizedBox(width: 6.0,),
        IconButton(onPressed: (){}, icon: Icon(Icons.menu,),),
      ],
    );
  }
}
