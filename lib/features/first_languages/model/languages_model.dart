class LanguagesModel {
  final String imageAssest;
  final String name;
  final String languageCode;

  LanguagesModel(
      {required this.imageAssest,
      required this.name,
      required this.languageCode});
}

final List<LanguagesModel> listLanguages = [
  LanguagesModel(
      imageAssest: 'assets/image/english.png',
      name: 'English',
      languageCode: 'en'),
  LanguagesModel(
      imageAssest: 'assets/image/hindi.png', name: 'Hindi', languageCode: 'hi'),
  LanguagesModel(
      imageAssest: 'assets/image/spanish.png',
      name: 'Spanish',
      languageCode: 'es'),
  LanguagesModel(
      imageAssest: 'assets/image/french.png',
      name: 'French',
      languageCode: 'fr'),
  LanguagesModel(
      imageAssest: 'assets/image/german.png',
      name: 'German',
      languageCode: 'de'),
  LanguagesModel(
      imageAssest: 'assets/image/indinesian.png',
      name: 'Indonesian',
      languageCode: 'id'),
  LanguagesModel(
      imageAssest: 'assets/image/portugal.png',
      name: 'Portuguese',
      languageCode: 'pt'),
  // LanguagesModel(
  //     imageAssest: 'assets/image/saudi arabia.png',
  //     name: 'Arabic',
  //     languageCode: 'ar'),
  // LanguagesModel(
  //     imageAssest: 'assets/image/russia.png',
  //     name: 'Russian',
  //     languageCode: 'ru'),
  // LanguagesModel(
  //     imageAssest: 'assets/image/vietnam.png',
  //     name: 'Vietnamese',
  //     languageCode: 'vi'),
  // LanguagesModel(
  //     imageAssest: 'assets/image/thailand.png',
  //     name: 'Thailand',
  //     languageCode: 'th'),
];
