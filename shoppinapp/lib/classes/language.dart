class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'πΊπΈ', "Engilish", "en"),
      Language(2, 'πΉπ·', "Turkish", "tr")
    ];
  }
}
