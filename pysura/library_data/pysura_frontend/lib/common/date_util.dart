import 'package:intl/intl.dart';

DateTime getUnixTime({required String txtTime}) {
  try {
    return DateTime.parse(txtTime);
  } catch (e) {
    return DateTime.now();
  }
}

String getFormattedTime({required DateTime time, required String dateFormat}) {
  return DateFormat(dateFormat).format(time.toLocal());
}

String getUnixTimestamp({required DateTime time}) {
  return time.toUtc().toIso8601String();
}
