class WordListModel
{
  final int id;
  final String arabicWord;
  final String foreignWord;

  WordListModel(
  {
    required this.id,
    required this.arabicWord,
    required this.foreignWord,
});

  factory WordListModel.fromJson(Map<String, dynamic> json)
  {
    return WordListModel(
        id: json['id'],
        arabicWord: json['arabicWord'],
        foreignWord: json['foreignWord']);
  }

}