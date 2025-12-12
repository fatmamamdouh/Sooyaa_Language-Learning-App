import 'package:flutter/cupertino.dart';
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
        SizedBox(width: 10,),
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
                height: 4.0,
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
          height: 24.0,
        ),
      ],
    );
  }
}
