import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountAsk extends StatelessWidget {
  final String ask;
  final String askBtn;
  final VoidCallback? onTap;
  final MainAxisAlignment align;
  const AccountAsk({
    super.key,
    required this.ask,
    required this.askBtn,
    this.onTap,
    this.align = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: align,
      children: [
        Text(
          ask,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            askBtn,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  decoration: TextDecoration.underline,
                  height: 1.5.r,
                ),
          ),
        ),
      ],
    );
  }
}
