extension StringExtension on String {
  String get capitalize => "${this[0].toUpperCase()}${substring(1)}";
  String get with0 => length == 1 ? "0$this" : this;
}
