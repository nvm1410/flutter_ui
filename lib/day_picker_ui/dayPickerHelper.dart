List<int> dayCountForMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
List<String> monthNames = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
List<String> dayNames = [ 'CN','T2', 'T3', 'T4', 'T5', 'T6', 'T7'];
int relatedWeekday({int month, int year, int day}) {
  var _monthToString = addZeroPrefix(month);
  var _dayToString = addZeroPrefix(day);
  return DateTime.parse('$year-$_monthToString-$_dayToString').weekday;
  // thứ hai là số 1
}

String addZeroPrefix(number) =>
    '00'.substring(number.toString().length) + '$number';
int dayCountForFebruary(year) {
  return year % 4 == 0 ? 29 : 28;
}

List dayToWeekday({int month, int year}) {
  final dayToWeekday = [];
  var _dayCountForMonth =
  month == 2 ? dayCountForFebruary(year) : dayCountForMonth[month - 1];
  // vì hiển thị lịch từ chủ nhật, ta thêm 0 vào những ngày trong tuần trước ngày 1
  var fistDayRelatedWeekday = relatedWeekday(day: 1, month: month, year: year);
  if(fistDayRelatedWeekday!=7){
    // nếu ngày đầu tháng là chủ nhật thì không thêm
    for (var i = 0; i < fistDayRelatedWeekday; i++) {
      dayToWeekday.add(0);
    }
  }

  for (var i = 1; i <= _dayCountForMonth; i++) {
    dayToWeekday.add(i);
  }
  return dayToWeekday;
}
