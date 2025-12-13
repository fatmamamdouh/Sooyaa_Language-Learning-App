import 'package:flutter/material.dart';
import '../../model/lesson_model.dart';

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
      onTap: () {
        if (lesson.isUnlocked) {
          completeLesson(index);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: lesson.isUnlocked ? const Color(0xff4A4A4A) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(lesson.image),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                lesson.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: lesson.isUnlocked ? Colors.white : Colors.black87,
                ),
              ),
            ),
            Icon(
              Icons.bookmark_border,
              color: lesson.isUnlocked ? Colors.white : Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
