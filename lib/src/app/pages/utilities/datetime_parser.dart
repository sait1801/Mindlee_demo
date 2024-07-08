class StringUtils {
  static String convertDateToString(
    DateTime date, {
    bool timeIncluded = false,
    bool yearIncluded = true,
    String delimeter = '•',
  }) {
    String hour = date.hour.toString().length != 1
        ? date.hour.toString()
        : '0${date.hour.toString()}';
    String minute = date.minute.toString().length != 1
        ? date.minute.toString()
        : '0${date.minute.toString()}';

    if (timeIncluded) {
      if (yearIncluded) {
        return '${date.day}.${date.month}.${date.year} $delimeter $hour.$minute';
      } else {
        return '${date.day}.${date.month} $delimeter $hour.$minute';
      }
    } else {
      return '${date.day}.${date.month}.${date.year}';
    }
  }

  static String convertTimeToString(DateTime time) {
    String hour = time.hour.toString().length != 1
        ? time.hour.toString()
        : '0${time.hour.toString()}';
    String minute = time.minute.toString().length != 1
        ? time.minute.toString()
        : '0${time.minute.toString()}';

    return '$hour:$minute';
  }

  static String getNumberWithPeriods(int number) {
    String numString = number.toString();
    String result = '';

    for (int i = numString.length - 1, j = 0; i >= 0; i--, j++) {
      if (j != 0 && j % 3 == 0) {
        result = '.' + result;
      }
      result = numString[i] + result;
    }

    return result;
  }
}
