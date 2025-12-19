class HomeDataModel
{
  final String lanName;
  final String lanFlag;
  final int streakScore;
  final int totalLessons;
  final int completedLesson;
  final String userLevel;
  final List<dynamic> categories;

  HomeDataModel({
    required this.lanName,
    required this.lanFlag,
    required this.streakScore,
    required this.totalLessons,
    required this.completedLesson,
    required this.userLevel,
    required this.categories,
});


  factory HomeDataModel.fromJson(Map<String, dynamic> json)
  {
    return HomeDataModel(
        lanName: json['lanName'],
        lanFlag: json['lanFlag'],
        streakScore: json['streakScore'],
        totalLessons: json['totalLessons'],
        completedLesson: json['completedLesson'],
        userLevel: json['userLevel'],
        categories: json['categories'],
    );
  }
}