import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/lesson_model.dart';
import '../../resources/app_colors.dart';

class LessonItems extends StatefulWidget {
  final LessonModel lesson;
  final List<LessonModel> lessons;
  final int index;

  const LessonItems({
    super.key,
    required this.lesson,
    required this.index,
    required this.lessons,
  });

  @override
  State<LessonItems> createState() => _LessonItemsState();
}

class _LessonItemsState extends State<LessonItems> {
  void completeLesson(int index) {
    setState(() {
      widget.lessons[index].isCompleted = true;

      // فتح الدرس اللي بعده
      if (index + 1 < widget.lessons.length) {
        widget.lessons[index + 1].isUnlocked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final lesson = widget.lesson;
    final index = widget.index;

    return GestureDetector(
      onTap: lesson.isUnlocked
          ? () {
              if (lesson.isUnlocked) {
                completeLesson(index);
              }
            }
          : null,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: lesson.isUnlocked ? AppColors.primaryColor : AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey5,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundImage: AssetImage(lesson.image),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                lesson.title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color:
                          lesson.isUnlocked ? AppColors.white : AppColors.grey5,
                    ),
              ),
            ),
            Icon(
              Icons.bookmark_border,
              color: lesson.isUnlocked ? AppColors.white : AppColors.grey5,
            ),
          ],
        ),
      ),
    );
  }
}
