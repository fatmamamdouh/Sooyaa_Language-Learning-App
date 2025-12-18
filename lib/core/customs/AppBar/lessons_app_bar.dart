import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_colors.dart';

class LessonsAppBar extends StatelessWidget {
  const LessonsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.close,),),
        SizedBox(width: 6.0.w,),
        Flexible(
          child: LinearProgressIndicator(
            minHeight: 12.0.h,
            borderRadius: BorderRadius.circular(100.0.r),
            value: .5,
            color: AppColors.primaryColor,
            backgroundColor: AppColors.fillColor,
          ),
        ),
        SizedBox(width: 6.0.w,),
        IconButton(onPressed: (){}, icon: const Icon(Icons.menu,),),
      ],
    );
  }
}
