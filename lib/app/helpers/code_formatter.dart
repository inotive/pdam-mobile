import 'package:intl/intl.dart';

class CodeFormatterApp {
  static String requestItem() {
    String prefix = 'PR-';
    String date = DateFormat("yyMMddHHmmssSSS", "id_ID").format(DateTime.now());
    String code = "$prefix$date";
    return code;
  }

  static String stockOpname() {
    String prefix = 'OPM-';
    String date = DateFormat("yyMMddHHmmssSSS", "id_ID").format(DateTime.now());
    String code = "$prefix$date";
    return code;
  }
}
