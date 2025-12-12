import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/customs/Containers/welcome_container.dart';

class SelectAppBar extends StatelessWidget {
  final String image;
  final String title;
  const SelectAppBar({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: AssetImage(image),
          height: 80.h,
          width: 60.w,
        ),
        WelcomeContainer(
          title: title,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

AppBar selectTwoAppBar({
  required BuildContext context,
  required String image,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios, size: 20.r),
      ),
      title: Image(
        image: AssetImage(image),
        height: 20.h,
        width: 100.w,
      ),
    );
