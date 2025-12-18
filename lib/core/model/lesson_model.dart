class LessonModel {
  final String title;
  final String image;
  bool isUnlocked;
  bool isCompleted;

  LessonModel({
    required this.title,
    required this.image,
    this.isUnlocked = false,
    this.isCompleted = false,
  });
}
