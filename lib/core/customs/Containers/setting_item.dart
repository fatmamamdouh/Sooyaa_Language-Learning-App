import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/text_style.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.propertyName,
    required this.propertyValue,
  });

  final String propertyName;
  final String propertyValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              propertyName,
              style: AppTextStyle.style16.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(propertyValue, style: AppTextStyle.style16),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0.h, top: 8.0.h),
          child: Container(
            height: 2.h,
            color: const Color(0xffF2F2F2),
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
