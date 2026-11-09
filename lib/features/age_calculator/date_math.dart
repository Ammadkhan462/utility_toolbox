/// Calendar-correct date differences for the Age & Date calculator.
class DateSpan {
  const DateSpan(this.years, this.months, this.days);
  final int years;
  final int months;
  final int days;

  @override
  bool operator ==(Object other) =>
      other is DateSpan && other.years == years && other.months == months && other.days == days;

  @override
  int get hashCode => Object.hash(years, months, days);

  @override
  String toString() => '${years}y ${months}m ${days}d';
}

DateTime _dateOnly(DateTime d) => DateTime.utc(d.year, d.month, d.day);

int _daysInMonth(int year, int month) => DateTime.utc(year, month + 1, 0).day;

/// [d] plus [months] calendar months, clamping the day to the target
/// month's length (31 Jan + 1 month = 28/29 Feb).
DateTime _addMonths(DateTime d, int months) {
  final total = d.year * 12 + (d.month - 1) + months;
  final year = total ~/ 12;
  final month = total % 12 + 1;
  return DateTime.utc(year, month, d.day.clamp(1, _daysInMonth(year, month)));
}

/// Years, months and days from [from] to [to] (order-independent), the way
/// people count ages: as many whole calendar months as fit, then the
/// remaining days.
DateSpan dateSpan(DateTime from, DateTime to) {
  var a = _dateOnly(from);
  var b = _dateOnly(to);
  if (a.isAfter(b)) {
    final t = a;
    a = b;
    b = t;
  }
  var months = (b.year - a.year) * 12 + (b.month - a.month);
  if (_addMonths(a, months).isAfter(b)) months--;
  final days = b.difference(_addMonths(a, months)).inDays;
  return DateSpan(months ~/ 12, months % 12, days);
}

/// Whole days between two dates (order-independent), ignoring time/DST.
int totalDays(DateTime from, DateTime to) =>
    _dateOnly(to).difference(_dateOnly(from)).inDays.abs();

/// Days until the next birthday on/after [today] (0 = today). A 29 Feb
/// birthday is celebrated on 28 Feb in non-leap years.
int daysUntilBirthday(DateTime birth, DateTime today) {
  final t = _dateOnly(today);
  DateTime birthdayIn(int year) {
    final day = (birth.month == 2 && birth.day == 29 && _daysInMonth(year, 2) == 28) ? 28 : birth.day;
    return DateTime.utc(year, birth.month, day);
  }

  var next = birthdayIn(t.year);
  if (next.isBefore(t)) next = birthdayIn(t.year + 1);
  return next.difference(t).inDays;
}

/// Monday–Friday days in [from, to] inclusive (order-independent).
int weekdaysBetween(DateTime from, DateTime to) {
  var a = _dateOnly(from);
  var b = _dateOnly(to);
  if (a.isAfter(b)) {
    final t = a;
    a = b;
    b = t;
  }
  final total = b.difference(a).inDays + 1;
  final fullWeeks = total ~/ 7;
  var count = fullWeeks * 5;
  for (var i = 0; i < total % 7; i++) {
    final wd = a.add(Duration(days: fullWeeks * 7 + i)).weekday;
    if (wd <= DateTime.friday) count++;
  }
  return count;
}
