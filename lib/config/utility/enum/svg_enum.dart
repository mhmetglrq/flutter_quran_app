enum SvgConstants {
  quran("quran"),
  headset("headset"),
  quranCard("quran_card"),
  tasbee("tasbee"),
  test("test"),
  cardBottom("card_bottom"),
  surahIndex("surah_index"),
  ;

  final String value;
  const SvgConstants(this.value);

  String get getSvg => 'assets/svg/$value.svg';
}
