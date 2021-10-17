import 'package:intl/intl.dart';

String currentDate(String mode) {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('MEd');
  final String formatted = formatter.format(now);
  // print(formatter.format(DateTime(now.year, now.month, now.day + 1)));

  if (mode == "dateRequest") {
    return dateToNum(formatted);
  }
  return formatted.substring(0, 3);
}

String dateToNum(String today) {
  switch (today.substring(0, 3)) {
    case 'Sun':
      return '7';
    case 'Mon':
      return '1';
    case 'Tue':
      return '2';
    case 'Wed':
      return '3';
    case 'Thu':
      return '4';
    case '5':
      return 'Fri';
    case 'Sat':
      return '6';
    default:
      return 'Can not defined';
  }
}
