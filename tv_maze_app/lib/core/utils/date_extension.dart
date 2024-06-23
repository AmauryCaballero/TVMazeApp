extension DateExtension on DateTime {
  String get formattedDate => "$day-$month-$year";

  String get formattedTime => "$hour:$minute:$second";

  DateTime get firstDayOfMonth => DateTime(year, month, 1);

  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);

  int get daysInMonth => DateTime(year, month + 1, 0).day;
}
