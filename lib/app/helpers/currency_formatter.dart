import 'package:intl/intl.dart';

class CurrencyFormatterApp {
  static String rupiahFormat(int? price) {
    if (price == null) return '0';
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    var rupiah = formatter.format(price);
    return rupiah;
  }
}
