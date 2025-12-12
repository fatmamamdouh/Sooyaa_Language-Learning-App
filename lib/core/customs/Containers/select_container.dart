import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooyaa_app/core/resources/app_colors.dart';

class SelectContainer extends StatelessWidget {
  final String title;
  final String image;
  final bool isSelected;
  final String? trailing;
  final VoidCallback? onTap;
  const SelectContainer({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 335.w,
        height: 47.h,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withValues(alpha: 0.15),
              blurRadius: 4,
              offset: const Offset(-4, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Image(
              image: AssetImage(image),
              height: 30.h,
              width: 30.w,
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color:
                        isSelected ? AppColors.white : AppColors.primaryColor,
                  ),
            ),
            const Spacer(),
            Text(
              trailing ?? '',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color:
                        isSelected ? AppColors.grey5 : AppColors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
