import 'package:intl/intl.dart';

String currentDate(String mode) {
  final DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('MEd');
  final String formatted = formatter.format(now);
  // print(formatter.format(DateTime(now.year, now.month, now.day + 1)));

  if (mode == "dateRequest") {
    return dateToNum(formatted);
  } else if (mode == "whole") {
    formatter = DateFormat('d');
    return formatter.format(now);
  }
  return formatted.substring(0, 3);
}

Map<String, int> generateWeekList() {
  Map<String, int> weekDays = {};
  final today = int.parse(currentDate('whole'));
  var futureDay = currentDate('no');
  weekDays[futureDay] = today;

  for (var i = 1; i < 7; i++) {
    futureDay = nextDate(futureDay);
    weekDays[futureDay] = today + i;
  }
  return weekDays;
}

String nextDate(String today) {
  List<String> dateList = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  // Handle last day of the week
  if (dateList.indexOf(today) == 6) {
    return dateList[0];
  } else {
    return dateList[dateList.indexOf(today) + 1];
  }
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
