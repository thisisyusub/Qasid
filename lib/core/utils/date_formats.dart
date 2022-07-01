import 'package:intl/intl.dart';

String formatTodayForHome(String locale) {
  return DateFormat('d MMMM, EEEE', locale).format(DateTime.now());
}
