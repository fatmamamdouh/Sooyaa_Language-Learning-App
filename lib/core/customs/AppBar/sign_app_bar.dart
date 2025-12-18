import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/app_images.dart';

AppBar signAppBar({required BuildContext context}) => AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back, size: 25.r),
      ),
      title: Image(image: AssetImage(AppImages.hello), height: 60.h),
    );
