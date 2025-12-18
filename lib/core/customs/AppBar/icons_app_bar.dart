import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar iconsAppBar(
        {required BuildContext context, required String image}) =>
    AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back, size: 25.r),
      ),
      actions: [
        Image(image: AssetImage(image), height: 40.h),
      ],
    );
