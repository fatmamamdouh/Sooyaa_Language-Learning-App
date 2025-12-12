import 'package:flutter/cupertino.dart';

import '../../resources/text_style.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.propertyName, required this.propertyValue});

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
            Spacer(),
            Text(propertyValue, style: AppTextStyle.style16,),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
          child: Container(
            height: 2,
            color: Color(0xffF2F2F2),
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
