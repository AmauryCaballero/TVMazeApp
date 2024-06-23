extension AssetsExtension on String {
  String get pngImage => 'assets/images/$this.png';
  String get jpgImage => 'assets/images/$this.jpg';
}
