import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateFormatterApp {
  static String defaultDate(String? date) {
    if (date == null || date == "" || date == "null") return "-";
    initializeDateFormatting('id_ID');
    final f = DateFormat("yyyy-MM-dd", "id_ID").format(DateTime.parse(date));
    return f.toString();
  }

  static String formatIndoDate(String? date) {
    if (date == null || date == "" || date == "null") return "-";
    initializeDateFormatting('id_ID');
    final f = DateFormat("dd MMMM yyyy", "id_ID").format(DateTime.parse(date));
    return f.toString();
  }

  static String formatIndoTime(String? dateTime) {
    if (dateTime == null || dateTime == "" || dateTime == "null") return "-";
    initializeDateFormatting('id_ID');
    final f = DateFormat("HH:mm WIB", "id_ID").format(DateTime.parse(dateTime));
    return f.toString();
  }

  static String formatIndoDateTime(String? dateTime) {
    if (dateTime == null || dateTime == "" || dateTime == "null") return "-";
    initializeDateFormatting('id_ID');
    final f = DateFormat("EEEE, dd MMM yyyy HH:mm:ss WIB", "id_ID").format(DateTime.parse(dateTime));
    return f.toString();
  }
}
