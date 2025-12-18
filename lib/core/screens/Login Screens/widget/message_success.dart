import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../customs/Buttons/account_ask.dart';
import '../../../customs/Buttons/custom_btn.dart';
import '../../../resources/app_texts.dart';

class MessageSuccess extends StatelessWidget {
  final VoidCallback resend;
  const MessageSuccess({
    super.key,
    required this.resend,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Plesse check your email in span to change your password",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 150.h,
        ),
        AccountAsk(
          ask: "Dont recive any code? ",
          askBtn: "Resend",
          align: MainAxisAlignment.start,
          onTap: resend,
        ),
        SizedBox(
          height: 30.h,
        ),
        Center(
          child: CustomBtn(
            title: AppTexts.continueBtn,
            onTap: () => Navigator.pop(context),
            hidden: false,
            isLoading: false,
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
