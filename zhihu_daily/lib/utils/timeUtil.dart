bool sameDay(DateTime time1, DateTime time2) {
  return time1.year == time2.year && time1.month == time2.month &&
      time1.day == time2.day;
}

String formatTime(DateTime time) {
  return time.month.toString() + '月' + time.day.toString() + '日 ' +
      weekInChinese(time.weekday);
}

String weekInChinese(int week) {
  switch (week) {
    case 1:
      return '星期一';
    case 2:
      return '星期二';
    case 3:
      return '星期三';
    case 4:
      return '星期四';
    case 5:
      return '星期五';
    case 6:
      return '星期六';
    case 7:
      return '星期日';
    default:
      return '';
  }
}