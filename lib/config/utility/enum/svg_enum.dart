enum SvgConstants {
  quran("quran"),
  ;

  final String value;
  const SvgConstants(this.value);

  String get getSvg => 'assets/svg/$value.svg';
}
