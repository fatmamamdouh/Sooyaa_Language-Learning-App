import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/text_style.dart';

class FreePlanItem extends StatelessWidget {
  const FreePlanItem({super.key, required this.time, required this.title, required this.desc});

  final String time;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: AppTextStyle.style16.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        SizedBox(width: 10.w,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.style16.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 4.0.h,
              ),
              Text(
                desc,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.style16.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.0.h,
        ),
      ],
    );
  }
}
