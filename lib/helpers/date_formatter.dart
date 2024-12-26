import 'package:intl/intl.dart';

String timeFormatter(String date){
  return DateFormat("HH:mm").
  format(DateTime.parse(date)
      .toLocal())
      .toString();
}
String timeFormatterEnhance(String date){
    return DateFormat("HH:mm").
  format(DateTime.parse(date)
      .toLocal())
      .toString();
}
String dateFormatter(String date){
  return DateFormat("dd-MMM-yyyy HH:mm").
  format(DateTime.parse(date)
      .toLocal())
      .toString();
}
String dateOnlyFormatter(String date){
  return DateFormat("yyyy-MM-dd").
  format(DateTime.parse(date)
      .toLocal())
      .toString();
}
String dateCompFormatter(String date){
  return DateFormat("EEEE,dd MMM").
  format(DateTime.parse(date)
      .toLocal())
      .toString();
}
String dateDayOnlyFormatter(String date){
  return DateFormat("dd E").
  format(DateTime.parse(date)
      .toLocal())
      .toString();
}

totalTimeCalculation(DateTime start, DateTime end){
  Duration duration = end.difference(start).abs();
  final hours = duration.inHours;
  final minutes = duration.inMinutes % 60;
  print('$hours hours $minutes minutes');
  if (hours == 0) {
    return '$minutes minutes';
  } else {
    return '$hours hours $minutes minutes';
  }
}