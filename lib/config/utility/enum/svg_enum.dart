enum SvgConstants {
  quran("quran"),
  headset("headset"),
  quranCard("quran_card"),
  tasbee("tasbee"),
  test("test"),
  cardBottom("card_bottom"),
  surahIndex("surah_index"),
  basmala("basmala"),
  share("share"),
  play("play"),
  bookmark("bookmark"),
  bookmarkFilled("bookmark_filled"),
  pause("pause");

  final String value;
  const SvgConstants(this.value);

  String get getSvg => 'assets/svg/$value.svg';
}
