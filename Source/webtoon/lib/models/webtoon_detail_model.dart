
class WebtoonDetailModel
{
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> toon): title = toon['title'],
                                                          about =toon['about'],
                                                          genre = toon['genre'],
                                                          age = toon['age'];




}